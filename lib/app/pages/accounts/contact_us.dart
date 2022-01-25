 import 'package:flutter/material.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/custom_textfield2.dart';
 import 'package:mms_app/app/components/text_widgets.dart';

import 'package:mms_app/app/utils/utils.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Contact Us',
        bottomNavigationBar: Container(
          color: AppColors.white,
          padding: EdgeInsets.all(20.h),
          child: SafeArea(
            child: buttonWithBorder(
              'Send Your Message',
              buttonColor: AppColors.orange,
              fontSize: 15.sp,
              height: 56.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onTap: () {
                Utils.unfocusKeyboard(context);
                email.text = '';
                message.text = '';
                showModalBottomSheet(
                    barrierColor: AppColors.darkBlue.withOpacity(.1),
                    isScrollControlled: true,
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.h),
                        topRight: Radius.circular(30.h),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 26.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 27.h),
                            Image.asset(
                              'assets/images/mark.png',
                              width: 64.h,
                            ),
                            SizedBox(height: 32.h),
                            regularText(
                              'Message Sent! 👏',
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                            SizedBox(height: 16.h),
                            regularText(
                              'Thank you for reaching out to us.\nPlease invite your friends to this great\napp and you’ll own a fraction of the\napp.',
                              fontSize: 15.sp,
                              textAlign: TextAlign.center,
                              color: AppColors.black,
                            ),
                            SizedBox(height: 50.h),
                            buttonWithBorder('Done',
                                buttonColor: AppColors.orange,
                                fontSize: 15.sp,
                                height: 56.h,
                                textColor: AppColors.white,
                                fontWeight: FontWeight.w600, onTap: () {
                              Navigator.pop(context);
                            }),
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          children: [
            SizedBox(height: 16.h),
            CustomTextField2(
              title: 'Email Address',
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: email,
            ),
            SizedBox(height: 16.h),
            CustomTextField2(
              title: 'Your message',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: message,
              maxLines: 5,
            ),
          ],
        ));
  }
}
