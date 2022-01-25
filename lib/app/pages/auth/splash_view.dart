import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mms_app/app/utils/local_storage.dart';
import 'package:mms_app/app/pages/auth/onboarding_view.dart';
import 'package:mms_app/app/pages/auth/start_auth_view.dart';
import 'package:mms_app/app/pages/home/main_layout.dart';
import 'package:mms_app/app/utils/router.dart';
import 'package:mms_app/app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      if (AppCache.getIsFirst()) {
        pushReplacement(context, OnboardingView());
      } else {
        String? uid = FirebaseAuth.instance.currentUser?.uid;
        if (uid == null) {
          pushReplacement(context, StartAuthView());
        } else {
          pushReplacement(context, MainLayout());
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Utils.offKeyboard();
    return Scaffold(
      backgroundColor: Color(0xffFFF1E2),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
        ),
        child: Image.asset(
          'assets/images/logo.png',
          height: 128.h,
          width: 128.h,
        ),
      ),
    );
  }
}
