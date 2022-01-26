import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/utils/local_storage.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/auth/signup1_view.dart';
import 'package:mms_app/app/utils/router.dart';

class StartAuthView extends StatefulWidget {
  @override
  _StartAuthViewState createState() => _StartAuthViewState();
}

class _StartAuthViewState extends State<StartAuthView> {
  @override
  Widget build(BuildContext context) {
    AppCache.haveFirstView();
    return CustomScaffold(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(
            'assets/images/logo.png',
            height: 128.h,
            width: 128.h,
          ),
          SizedBox(height: 50.h),
          regularText(
            'Share with your\nfriends',
            fontSize: 37.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
          SizedBox(height: 10.h),
          regularText(
            'Do you mind inviting a couple of your\nfriends to this great app?\nYou’ll own a fraction of the app for that.',
            fontSize: 15.sp,
            textAlign: TextAlign.center,
            height: 1.8,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          SizedBox(height: 30.h),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(20.h),
            child: buttonWithBorder(
              'Register',
              buttonColor: AppColors.orange,
              fontSize: 15.sp,
              height: 56.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onTap: () => push(context, Signup1View()),
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
      bottomNavigationBar:  Container(
        color: Colors.transparent,
        padding:   EdgeInsets.all(20.h),
        child: SafeArea(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Have an account? ',
              style: GoogleFonts.rubik(
                color: AppColors.textBlack,
                fontSize: 15.sp,
              ),
              children: [
                TextSpan(
                    text: 'Login',
                    style: GoogleFonts.rubik(
                      color: AppColors.green,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      push(context, Signup1View(isLogin:true));
                    }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
