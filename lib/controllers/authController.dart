import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe2/Screen/explore.dart';
import 'package:recipe2/Screen/login.dart';
import 'package:recipe2/Screen/waitAfterSignup.dart';
import 'package:recipe2/Services/database.dart';
import 'package:recipe2/controllers/userController.dart';
import 'package:recipe2/models/user.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();

  User get user => _firebaseUser.value;

  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }

  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(
    String name,
    String email,
    String password,
    String uid,
  ) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user.uid,
        name: name,
        email: _authResult.user.email,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.to(Waiting());
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.to(Explore());
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user.uid);
    } catch (e) {
      Get.snackbar('Error Signing In', e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

void skipUser()async{
  UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
}
  Future<String> signInWithGoogle() async {
    String retVal = 'Error';
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    UserModel _user = UserModel();
    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: _googleAuth.idToken, accessToken: _googleAuth.accessToken);
      UserCredential _authResult = await _auth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo.isNewUser) {
        _user.id = _authResult.user.uid;
        _user.email = _authResult.user.email;
        _user.name = _authResult.user.displayName;
        Database().createNewUser(_user);
      }
      await Get.to(Explore());
      retVal = 'success';
    } catch (e) {
      retVal = e.message;
    }
    return retVal;
  }

  void signOut() async {
    try {
      final googleSignIn =GoogleSignIn();
      await googleSignIn.signOut();
      await _auth.signOut();
      Get.to(() => Login());
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar('Error Signing Out', e.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

}
