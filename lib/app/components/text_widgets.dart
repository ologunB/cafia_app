import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:mms_app/app/utils/colors.dart';

Widget regularText(String text,
    {Color? color,
    double? fontSize = 14,
    double? letterSpacing,
    double? height,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    FontWeight? fontWeight,
    bool blur = false}) {
  return blur
      ? Blur(
          blur: 3,
          blurColor: Colors.white,
          child: Text(
            text,
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: overflow,
            softWrap: true,
            style: GoogleFonts.rubik(
              color: color,
              letterSpacing: letterSpacing,
              fontSize: fontSize,
              height: height,
              fontWeight: fontWeight,
              decoration: decoration,
            ),
          ))
      : Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          softWrap: true,
          style: GoogleFonts.rubik(
            color: color,
            letterSpacing: letterSpacing,
            fontSize: fontSize,
            height: height,
            fontWeight: fontWeight,
            decoration: decoration,
          ),
        );
}

Widget userNameText(
  String text, {
  Color? color,
  double? fontSize = 14,
  double? letterSpacing,
  double? height,
  TextAlign? textAlign,
  int? maxLines,
  TextOverflow? overflow,
  TextDecoration? decoration,
  FontWeight? fontWeight,
  bool blur = false,
  Color? usernameColor,
}) {
  return blur
      ? Blur(
          blur: 3,
          blurColor: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: textAlign,
                maxLines: maxLines,
                overflow: overflow,
                softWrap: true,
                style: GoogleFonts.rubik(
                  color: color,
                  letterSpacing: letterSpacing,
                  fontSize: fontSize,
                  height: height,
                  fontWeight: fontWeight,
                  decoration: decoration,
                ),
              ),
              if (usernameColor != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.h),
                  child: Image.asset(
                    'assets/images/star.png',
                    height: fontSize! * 0.8,
                    color: usernameColor,
                  ),
                ),
            ],
          ),
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              textAlign: textAlign,
              maxLines: maxLines,
              overflow: overflow,
              softWrap: true,
              style: GoogleFonts.rubik(
                color: color,
                letterSpacing: letterSpacing,
                fontSize: fontSize,
                height: height,
                fontWeight: fontWeight,
                decoration: decoration,
              ),
            ),
            if (usernameColor != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Image.asset(
                  'assets/images/star.png',
                  height: fontSize! * 0.8,
                  color: usernameColor,
                ),
              ),
          ],
        );
}
