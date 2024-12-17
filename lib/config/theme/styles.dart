import 'package:flutter/material.dart';

import 'colors.dart';

ColorsSheme _colors = ColorsSheme();

class StylesSheme {
  ColorsSheme colors;
  StylesSheme(this.colors) {
    _colors = colors;
  }
// Başlık Stilleri
  TextStyle heading1 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: _colors.grey100, //Colors.deepPurple,
    fontFamily: 'SF_PRO_Display',
  );

  TextStyle heading2 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    color: _colors.grey100, //Colors.teal,
    fontFamily: 'SF_PRO_Display',
  );

  TextStyle heading3 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: _colors.orange300, // Colors.orange,
    fontFamily: 'SF_PRO_Display',
  );
  TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    color: _colors.grey500, // Colors.grey[600],
    fontFamily: 'SF_PRO_Display',
  );

// Metin Stilleri
  TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    color: _colors.grey100, // Colors.grey[800],
    fontFamily: 'SF_PRO_Display',
  );

  TextStyle bodyTextBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: _colors.grey100, // Colors.grey[800],
    fontFamily: 'SF_PRO_Display',
  );

  TextStyle emphasizedText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
    color: _colors.grey100, // Colors.blue,
    fontFamily: 'SF_PRO_Display',
  );

  TextStyle smallBodyText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    color: _colors.grey100, // Colors.grey[600],
    fontFamily: 'SF_PRO_Display',
  );

  TextStyle tinyCaptionText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    color: _colors.grey100, // Colors.grey,
    fontFamily: 'SF_PRO_Display',
  );

// Açıklama Stilleri
  TextStyle captionText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    color: _colors.grey100, // Colors.grey,
    fontFamily: 'SF_PRO_Display',
  );

// Buton Stilleri
  TextStyle buttonText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    color: _colors.grey100, //_colors.grey50, // Colors.white,
    // backgroundColor: Colors.blue,
    fontFamily: 'SF_PRO_Display',
  );

  TextStyle buttonTextSecondary = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    color: _colors.grey100, // Colors.blue,
    fontFamily: 'SF_PRO_Display',
  );

// Bağlantı Stilleri
  TextStyle linkText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    color: _colors.grey100, // Colors.blue,
    decoration: TextDecoration.underline,
    fontFamily: 'SF_PRO_Display',
  );

  TextStyle highlightedLinkText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: _colors.grey100, // Colors.purple,
    decoration: TextDecoration.underline,
    fontFamily: 'SF_PRO_Display',
  );

  TextStyle tinyLinkText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    color: _colors.grey100, // Colors.blue,
    decoration: TextDecoration.underline,
    fontFamily: 'SF_PRO_Display',
  );

  TextStyle lineThroughText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    color: _colors.grey100, // Colors.blue,
    decoration: TextDecoration.lineThrough,
    fontFamily: 'SF_PRO_Display',
  );
}
