import 'package:flutter/cupertino.dart';
import 'package:mms_app/app/components/text_widgets.dart';

Widget scoreItem(String a, String b) {
  Color color1 = a == 'RM' ? AppColors.lightGreen :  a == 'RG' ? Color(0xffFFFAF9):AppColors.lemon ;
  Color color2 = a == 'RM' ? AppColors.darkGreen :  a == 'RG' ?AppColors.darkOrange: AppColors.black;
  Color color3 = a == 'RM' ? Color(0xffECFDF3) : a == 'RG' ? Color(0xffFFF1E2): AppColors.green;
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 6.h),
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(30.h), color: color1),
    child: Row(
      children: [
        regularText(
          '$a:',
          fontSize: 14.sp,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          color: color2,
        ),
        SizedBox(width: 6.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.h), color: color3),
          child: regularText(
            b,
            fontSize: 14.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: color2,
          ),
        )
      ],
    ),
  );
}
