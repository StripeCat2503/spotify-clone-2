import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone/gen/colors.gen.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: ColorName.primary,
  primaryColor: ColorName.primary,
  textTheme: _textTheme,
  fontFamily: GoogleFonts.montserrat().fontFamily,
);

final _textTheme = GoogleFonts.montserratTextTheme();
