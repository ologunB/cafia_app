 import 'package:flutter/material.dart';
 import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/custom_textfield.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/auth/signup4_view.dart';
 import 'package:mms_app/app/utils/router.dart';

class Signup3View extends StatefulWidget {
  @override
  _Signup3ViewState createState() => _Signup3ViewState();
}

class _Signup3ViewState extends State<Signup3View> {
  TextEditingController country = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool accept = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: '',
        child: ListView(
          padding: EdgeInsets.all(20.h),
          children: [
            SizedBox(height: 50.h),
            regularText(
              'Let’s setup your\nprofile, shall we?',
              fontSize: 37.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: 10.h),
            regularText(
              'It will only take a second.',
              fontSize: 15.sp,
              textAlign: TextAlign.center,
              height: 1.8,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
            SizedBox(height: 54.h),
            CustomTextField(
              hintText: 'Username',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: country,
            ),
            SizedBox(height: 20.h),
            CustomTextField(
              hintText: 'Email Address',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: country,
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
                push(context, Signup4View());
              },
            ),
            SizedBox(height: 40.h),
          ],
        ));
  }
}
