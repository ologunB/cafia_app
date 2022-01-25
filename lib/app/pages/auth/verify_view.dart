import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/custom_pin_textfield.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/utils/local_storage.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/home/main_layout.dart';
import 'package:mms_app/app/utils/router.dart';

class VerifyView extends StatefulWidget {
  final String token;
  final String code;
  final String phone;

  VerifyView(this.token, this.code, this.phone);

  @override
  _VerifyViewState createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  TextEditingController code = TextEditingController();

  Timer? countdown;
  int remainingTime = 60;

  @override
  void initState() {
    countdown = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      remainingTime--;
      setState(() {});
      if (remainingTime == 0) {
        countdown?.cancel();
        return;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    countdown?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          SizedBox(height: 50.h),
          regularText(
            'Verify your phone\nnumber',
            fontSize: 37.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(height: 10.h),
          regularText(
            'Please enter the 6-digit code that was sent to\n(${widget.code.substring(1)}) ${widget.phone}.',
            fontSize: 15.sp,
            textAlign: TextAlign.center,
            height: 1.8,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          SizedBox(height: 61.h),
          CustomPinTextField(
            controller: code,
            maxLength: 6,
            onDone: (a) {
              verifyNumber();
            },
          ),
          SizedBox(height: 20.h),
          buttonWithBorder(
            'Verify Account',
            buttonColor: AppColors.orange,
            fontSize: 15.sp,
            height: 56.h,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
            busy: isLoading,
          ),
          SizedBox(height: 40.h),
        ],
      ),
      bottomSheet: Container(
          color: AppColors.lemon,
          padding: EdgeInsets.all(20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Haven’t received? Wait for ',
                  style: GoogleFonts.rubik(
                    color: AppColors.textBlack,
                    fontSize: 15.sp,
                  ),
                  children: [
                    TextSpan(
                        text: remainingTime.toString() +
                            (remainingTime < 10 ? ' sec' : ' secs'),
                        style: GoogleFonts.rubik(
                          color: AppColors.orange,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {}),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  bool isLoading = false;

  verifyNumber() async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    setState(() {
      isLoading = true;
    });
    String smsCode = code.text.trim();

    PhoneAuthCredential _credential = PhoneAuthProvider.credential(
        verificationId: widget.token, smsCode: smsCode);

    try {
      UserCredential result =
          await _firebaseAuth.signInWithCredential(_credential);

      setState(() {
        isLoading = false;
      });
      if (result.additionalUserInfo!.isNewUser) {
        AppCache.setFilledProfile(false);
        pushAndRemoveUntil(context, MainLayout());
      } else {
        AppCache.setFilledProfile(false);
        pushAndRemoveUntil(context, MainLayout());
        return;
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      errorSnackBar(context, e.message!);
    } on PlatformException catch (e) {
      setState(() {
        isLoading = false;
      });
      errorSnackBar(context, e.message!);
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      errorSnackBar(context, e.toString());
    }
  }
}
