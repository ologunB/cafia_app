import 'package:flutter/material.dart';
import 'package:mms_app/app/components/flutter_simple_rating_bar.dart';
import 'package:mms_app/app/components/score_item.dart';
import 'package:mms_app/app/components/text_widgets.dart';

class ProfilePreview extends StatelessWidget {
  const ProfilePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.asset(
                'assets/images/placeholder.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'assets/images/close2.png',
                  width: 56.h,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
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
                isIndicator: true,
                allowHalfRating: true,
                color: Color(0xffE5A800),
              ),
            ],
          ),
          SizedBox(height: 26.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              scoreItem('RM', '120'),
              SizedBox(width: 8.h),
              scoreItem('RG', '120'),
            ],
          ),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
