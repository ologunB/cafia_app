 import 'package:flutter/material.dart';
 import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/custom_textfield.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/auth/signup5_view.dart';
 import 'package:mms_app/app/utils/router.dart';

class Signup4View extends StatefulWidget {
  @override
  _Signup4ViewState createState() => _Signup4ViewState();
}

class _Signup4ViewState extends State<Signup4View> {
  TextEditingController bio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: '',
        child: ListView(
          padding: EdgeInsets.all(20.h),
          children: [
            SizedBox(height: 50.h),
            regularText(
              'A picture is worth a\nbillion words',
              fontSize: 37.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: 10.h),
            regularText(
              'Do you have one?',
              fontSize: 15.sp,
              textAlign: TextAlign.center,
              height: 1.8,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            SizedBox(height: 54.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100.h,
                  width: 100.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.h),
                    color: AppColors.white,
                  ),
                  child: Image.asset(
                    'assets/images/camera.png',
                    width: 36.h,
                    height: 36.h,
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              hintText: 'Bio',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: bio,
              maxLines: 5,
            ),

            SizedBox(height: 20.h),
            buttonWithBorder(
              'Next',
              buttonColor: AppColors.orange,
              fontSize: 15.sp,
              height: 56.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onTap: () {
                push(context, Signup5View());
              },
            ),
            SizedBox(height: 40.h),
          ],
        ));
  }
}
