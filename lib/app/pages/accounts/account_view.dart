import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mms_app/app/components/custom_dialog.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/flutter_simple_rating_bar.dart';
import 'package:mms_app/app/components/referral_dialog.dart';
import 'package:mms_app/app/components/score_item.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/accounts/payment_history.dart';
import 'package:mms_app/app/pages/accounts/referral_program.dart';
import 'package:mms_app/app/pages/auth/start_auth_view.dart';
import 'package:mms_app/app/utils/router.dart';

import 'about_layout.dart';
import 'account_settings.dart';
import 'blocked_users.dart';
import 'contact_us.dart';
import 'edit_profile.dart';
import 'help_us_grow.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        child: ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      children: [
        SizedBox(height: 10.h),
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
        userNameText(
          '@jacob_w',
          fontSize: 17.sp,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
          usernameColor: Color(0xffFFA384),
        ),
        SizedBox(height: 6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/flag.png', width: 20.h),
            SizedBox(width: 6.h),
            regularText(
              'Oyo',
              fontSize: 13.sp,
              color: AppColors.textBlack,
            ),
          ],
        ),
        SizedBox(height: 11.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.h),
          child: regularText(
            'I could eat all day ✌🏾. I could game all day👌🏻. I could skateboard all day❤️',
            fontSize: 15.sp,
            textAlign: TextAlign.center,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar(
              rating: 4,
              icon:
                  Icon(Icons.star_rounded, size: 40, color: Color(0xffE5A800)),
              starCount: 5,
              spacing: 5.h,
              size: 24,
              isIndicator: true,
              allowHalfRating: true,
              color: Color(0xffE5A800),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            scoreItem('RM', '120'),
            SizedBox(width: 8.h),
            scoreItem('RG', '120'),
          ],
        ),
        SizedBox(height: 35.h),
        Container(
          padding: EdgeInsets.all(14.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20.h),
          ),
          child: ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListView.separated(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: profileItems().length,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.h),
                    child: Divider(
                      height: 0,
                      thickness: 1.h,
                      color: AppColors.grey.withOpacity(.2),
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        if (index == 2) {
                          showDialog<AlertDialog>(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) => Container(
                              color: AppColors.darkBlue.withOpacity(.1),
                              child: AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                content: ReferralDialog(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.h)),
                              ),
                            ),
                          );
                          return;
                        }
                        push(context, profileItems()[index].goto);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.h, horizontal: 10.h),
                        child: Row(
                          children: [
                            regularText(profileItems()[index].title,
                                fontSize: 14.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600),
                            Spacer(),
                            Image.asset(
                              'assets/images/forward.png',
                              width: 20.h,
                              height: 20.h,
                            )
                          ],
                        ),
                      ));
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Divider(
                  height: 0,
                  thickness: 1.h,
                  color: AppColors.grey.withOpacity(.2),
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog<AlertDialog>(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) => Container(
                      color: AppColors.darkBlue.withOpacity(.1),
                      child: AlertDialog(
                        insetPadding: EdgeInsets.symmetric(horizontal: 10.h),
                        contentPadding: EdgeInsets.zero,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        content: CustomDialog(
                          title: 'Log Out',
                          desc: 'Are you sure you want to log out?',
                          primary: 'Yes, Logout',
                          secondary: 'Cancel',
                          primaryAction: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.of(context).pop();
                            pushAndRemoveUntil(context, StartAuthView());
                          },
                          secondaryAction: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.h)),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.h),
                  child: Row(
                    children: [
                      regularText('Logout',
                          fontSize: 14.sp,
                          color: AppColors.btnRed,
                          fontWeight: FontWeight.w600),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: Divider(
                  height: 0,
                  thickness: 1.h,
                  color: AppColors.grey.withOpacity(.2),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.h),
                child: regularText(
                  'Cafia 2022',
                  textAlign: TextAlign.center,
                  fontSize: 15.sp,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 100.h)
      ],
    ));
  }

  List<ProfileItem> profileItems() => [
        ProfileItem('Personal Details', EditProfile()),
        ProfileItem('Account Settings', AccountSettings()),
        ProfileItem('Referral Program', ReferralProgram()),
        ProfileItem('Payment History', PaymentHistory()),
        ProfileItem('Help Us Grow', HelpUsGrow()),
        ProfileItem('Blocked Users', BlockedUsers()),
        ProfileItem('About Us', AboutLayout()),
        ProfileItem('Contact Us', ContactUs()),
      ];
}

class ProfileItem {
  String title;
  Widget goto;

  ProfileItem(this.title, this.goto);
}
