import 'package:flutter/material.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/requests/my_requests.dart';

import 'my_responses.dart';

class RequestLayout extends StatefulWidget {
  const RequestLayout({Key? key}) : super(key: key);

  @override
  _RequestLayoutState createState() => _RequestLayoutState();
}

class _RequestLayoutState extends State<RequestLayout> {
  PageController _pageController = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        removeImage: true,
        removeBack: true,
        title: 'Overview',
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.h),
              padding: EdgeInsets.all(6.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.h),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _pageController.animateToPage(
                        0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(14.h),
                        decoration: _index == 1
                            ? null
                            : BoxDecoration(
                                color: AppColors.lightOrange,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(.3),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.h),
                              ),
                        child: regularText('My Requests (2)',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: _index == 1
                                ? AppColors.textBlack
                                : AppColors.black,
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => _pageController.animateToPage(
                        1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(14.h),
                        decoration: _index == 0
                            ? null
                            : BoxDecoration(
                                color: AppColors.lightOrange,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.grey.withOpacity(.3),
                                    blurRadius: 2,
                                    spreadRadius: 1,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.h),
                              ),
                        child: regularText('My Responses (0)',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: _index == 0
                                ? AppColors.textBlack
                                : AppColors.black,
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (a) => setState(() => _index = a),
                children: [MyRequests(), MyResponses()],
              ),
            )
          ],
        ));
  }
}
