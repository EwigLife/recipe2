import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe2/Utils/constants.dart';

buildTextTitleVariation1(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: GoogleFonts.breeSerif(
        fontSize: 30,
        fontWeight: FontWeight.w900,
        color: blackk,
      ),
    ),
  );
}

buildTextSubTitleVariation2(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[400],
      ),
    ),
  );
}

buildTextTitleVariation2(String text, bool opacity) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: opacity ? Colors.grey[400] : blackk,
      ),
    ),
  );
}

buildTextSubTitleVariation1(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      style: TextStyle(
          fontSize: 19, fontWeight: FontWeight.bold, color: Colors.grey[400]),
    ),
  );
}

buildTextSubTitleVariation(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: HtmlWidget(
      text,
    ),
  );
}

// buildTextSubTitleVariation2(String text){
//   return Padding(
//     padding: EdgeInsets.only(bottom: 8),
//     child: Text(
//       text,
//       overflow: TextOverflow.ellipsis,
//       style: TextStyle(
//         fontSize: 16,
//         color: Colors.grey[400],
//       ),
//     ),
//   );
// }

buildRecipeTitle(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

buildRecipeSubTitle(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16),
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[400],
      ),
    ),
  );
}

buildCalories(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 15,
      color: blackk,
      fontWeight: FontWeight.bold,
    ),
  );
}
