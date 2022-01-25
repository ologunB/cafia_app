import 'package:flutter/material.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/utils/utils.dart';

class RequestPreview extends StatefulWidget {
  const RequestPreview({Key? key}) : super(key: key);

  @override
  _RequestPreviewState createState() => _RequestPreviewState();
}

class _RequestPreviewState extends State<RequestPreview> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: AppColors.grey, width: .5.h))),
                  child: Image.asset(
                    'assets/images/placeholder.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 26.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30.h),
                          child: Image.asset(
                            'assets/images/placeholder.png',
                            height: 44.h,
                            width: 44.h,
                          ),
                        ),
                        SizedBox(width: 10.h),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              userNameText(
                                'joshua_l',
                                fontSize: 15.sp,
                                color: AppColors.black,
                                fontWeight: FontWeight.w600,
                                usernameColor: Color(0xffFFA384),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                children: [
                                  Image.asset('assets/images/flag.png',
                                      width: 20.h),
                                  SizedBox(width: 6.h),
                                  regularText(
                                    'Oyo',
                                    fontSize: 13.sp,
                                    color: AppColors.textBlack,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    regularText(
                      'This is the title pf the request.. ',
                      fontSize: 15.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 10.h),
                    regularText(
                      'joshua_l The game in Japan was amazing and I want to sharjoshua_l The game in Japan was amazing and I want to share some photosjoshua_l The game in Japan was amazing and I want to share some photose some photos',
                      fontSize: 13.sp,
                      color: AppColors.textBlack,
                    ),
                    SizedBox(height: 15.h),
                    regularText(
                      Utils.todaysDate(),
                      fontSize: 10.sp,
                      color: AppColors.textBlack,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        item('like', '20k'),
                        item('bookmark', '224'),
                        item('share', '112'),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset('assets/images/close2.png', height: 56.h),
        ),
      ],
    );
  }

  Widget item(String a, String b) {
    return Padding(
      padding: EdgeInsets.only(right: 25.h),
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/$a.png',
              height: 20.h,
              width: 20.h,
            ),
            SizedBox(width: 6.h),
            regularText(
              b,
              fontSize: 13.sp,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
