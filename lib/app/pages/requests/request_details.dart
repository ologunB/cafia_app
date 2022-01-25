import 'package:flutter/material.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/my_request_item.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/home/message_details.dart';
import 'package:mms_app/app/utils/router.dart';

class RequestDetails extends StatefulWidget {
  const RequestDetails({Key? key}) : super(key: key);

  @override
  _RequestDetailsState createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Request Title',
        removeImage: true,
        child: ListView(
          shrinkWrap: true,
          children: [
            MyRequestItem(0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8.h),
              child: regularText(
                'My Responses(23)',
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            ListView.builder(
                itemCount: 23,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 20.h),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      push(context, ChatDetailsView());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.h),
                        color: AppColors.white,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.h),
                      margin:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.h),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.h),
                            child: Image.asset(
                              'assets/images/placeholder.png',
                              height: 40.h,
                              width: 40.h,
                            ),
                          ),
                          SizedBox(width: 10.h),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    userNameText(
                                      'Sheryl Sandberg',
                                      fontSize: 12.sp,
                                      color: AppColors.green,
                                      fontWeight: FontWeight.w600,
                                      usernameColor: Color(0xffFFA384),
                                    ),
                                    Spacer(),
                                    regularText(
                                      'Thu',
                                      fontSize: 13.sp,
                                      color: AppColors.grey,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          regularText(
                                            'This is the title pf the request.. ',
                                            fontSize: 14.sp,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(height: 3.h),
                                          regularText(
                                            'You: I hope I’ll be able to charge my car there. Or I’ll need some help for comi...',
                                            fontSize: 11.sp,
                                            color: AppColors.textBlack,
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (index % 3 == 1)
                                      Container(
                                          height: 22.h,
                                          width: 22.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.h),
                                              color: AppColors.btnRed),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              regularText(
                                                '1',
                                                fontSize: 11.sp,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ));
  }
}
