import 'package:get/get.dart';
import 'package:recipe2/controllers/authController.dart';




class AuthBinding extends Bindings {
  @override  
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
      }
    
      
}