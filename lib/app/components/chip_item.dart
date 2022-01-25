import 'package:flutter/material.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/utils/country_cities.dart';

Widget chipItem({City? chip, String? category, Function()? onTap}) {
  return Container(
    margin: EdgeInsets.only(right: 8.h, bottom: 8.h),
    padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.h),
    decoration: BoxDecoration(
      color: Color(0xffFFF6ED),
      borderRadius: BorderRadius.circular(40.h),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (category != null)
          regularText(
            category,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.red,
          ),
        if (chip != null)
          regularText(
            chip.city + ', ' + chip.country,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.red,
          ),
        SizedBox(width: 6.h),
        InkWell(
          onTap: onTap,
          child: Icon(
            Icons.close,
            color: AppColors.red,
            size: 20.h,
          ),
        )
      ],
    ),
  );
}
