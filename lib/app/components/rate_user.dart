import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mms_app/app/components/score_item.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';

import 'buttons.dart';
import 'custom_textfield2.dart';
import 'flutter_simple_rating_bar.dart';

class RateUser extends StatefulWidget {
  @override
  _RateUserState createState() => _RateUserState();
}

class _RateUserState extends State<RateUser> {
  TextEditingController reason = TextEditingController();
  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.white,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    alignment: Alignment.center,
                    height: 56.h,
                    child: regularText('',
                        fontSize: 17.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      'assets/images/close2.png',
                      width: 56.h,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.h),
                        child: Image.asset(
                          'assets/images/placeholder.png',
                          width: 96.h,
                          height: 96.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 11.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      scoreItem('RM', '120'),
                      SizedBox(width: 8.h),
                      scoreItem('RG', '120'),
                    ],
                  ),
                  SizedBox(height: 11.h),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'How was your experience\nwith ',
                      style: GoogleFonts.rubik(
                        color: AppColors.black,
                        fontSize: 20.sp,
                      ),
                      children: [
                        TextSpan(
                            text: '@jacob_w',
                            style: GoogleFonts.rubik(
                              color: AppColors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar(
                        rating: 4,
                        icon: Icon(Icons.star_rounded,
                            size: 40, color: Color(0xffE5A800)),
                        starCount: 5,
                        spacing: 5.h,
                        size: 24,
                        allowHalfRating: true,
                        color: Color(0xffE5A800),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  CustomTextField2(
                    title: 'Write a comment',
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: comment,
                    maxLines: 5,
                    isRate: true,
                  ),
                  SizedBox(height: 30.h),
                  buttonWithBorder(
                    'Submit Review',
                    buttonColor: AppColors.orange,
                    fontSize: 15.sp,
                    height: 56.h,
                    textColor: AppColors.white,
                    fontWeight: FontWeight.w600,
                    onTap: () {
                      successSnackBar(context, 'Review Submitted\nThank you.');
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
