import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/dashboard_request_item.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/accounts/edit_profile.dart';
import 'package:mms_app/app/utils/router.dart';

class DashboardView extends StatefulWidget {
  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        removeImage: true,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoTextField(
                      cursorColor: AppColors.black.withOpacity(0.4),
                      maxLines: 1,
                      style: GoogleFonts.rubik(
                        color: AppColors.black,
                        fontSize: 15.sp,
                        letterSpacing: 0.4,
                        fontWeight: FontWeight.w600,
                      ),
                      prefix: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.h),
                            child: Image.asset(
                              'assets/images/search.png',
                              height: 16.h,
                              color: AppColors.grey,
                            ),
                          )
                        ],
                      ),
                      prefixMode: OverlayVisibilityMode.always,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(30.h),
                      ),
                      placeholder: 'Search...',
                      placeholderStyle: GoogleFonts.rubik(
                        color: AppColors.grey,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.h),
                    child: InkWell(
                      onTap: () {
                        push(context, EditProfile());
                      },
                      child: Image.asset(
                        'assets/images/placeholder.png',
                        height: 40.h,
                        width: 40.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.only(
                      top: 10.h, bottom: 100.h, left: 20.h, right: 20.h),
                  itemBuilder: (context, index) {
                    return DashboardRequestItem(index);
                  }),
            ),
          ],
        ));
  }
}
