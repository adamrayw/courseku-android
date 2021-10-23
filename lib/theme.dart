import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryTextColor = const Color(0xff3B82F6);
Color secondaryTextColor = const Color(0xffBFB4B4);
Color headerTextColor = const Color(0xff5B5B5B);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
  fontWeight: FontWeight.bold,
);
TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
);
TextStyle headerTextStyle = GoogleFonts.poppins(
  color: headerTextColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
