import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/empty_widget.dart';
import 'package:mms_app/app/components/text_widgets.dart';

class NotificationsView extends StatefulWidget {
  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  bool empty = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () => setState(() => empty = false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Notifications',
        removeBack: true,
        child: empty
            ?  AppEmptyWidget(
            'No Notifications', 'There’s no activity to show for your account\nat this time.')
            : Container(
                margin: EdgeInsets.only(bottom: 20.h, right: 20.h, left: 20.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.h),
                ),
                child: GroupedListView<int, String>(
                  padding: EdgeInsets.only(
                      top: 20.h, right: 20.h, left: 20.h, bottom: 100.h),
                  elements: List.generate(6, (index) => index + 1),
                  groupBy: (element) => '',
                  groupSeparatorBuilder: (String groupByValue) {
                    return Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h, top: 12.h),
                          child: regularText(
                            'Today',
                            fontSize: 15.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    );
                  },
                  itemBuilder: (context, int element) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.h),
                          child: Image.asset(
                            'assets/images/placeholder.png',
                            height: 40.h,
                            width: 40.h,
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: '@izabellarodrigues ',
                                  style: GoogleFonts.rubik(
                                    color: AppColors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  children: [
                                    TextSpan(
                                      text: 'Made a new Request',
                                      style: GoogleFonts.rubik(
                                        color: AppColors.black,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),
                              if (element % 2 == 0)
                                regularText(
                                  '“I need iphone X 128gb white.”',
                                  fontSize: 13.sp,
                                  color: AppColors.black,
                                ),
                              SizedBox(height: 5.h),
                              regularText(
                                'Last Wednesday at 9:42 AM',
                                fontSize: 11.sp,
                                color: AppColors.textBlack,
                                fontWeight: FontWeight.w400,
                              )
                            ],
                          ),
                        )),
                        if (element % 3 == 0)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.h),
                            child: Image.asset(
                              'assets/images/placeholder.png',
                              height: 50.h,
                              width: 50.h,
                            ),
                          ),
                      ],
                    ),
                  ),
                  itemComparator: (b, a) => b.compareTo(a),
                  useStickyGroupSeparators: false,
                  floatingHeader: false,
                  order: GroupedListOrder.DESC,
                ),
              ));
  }
}
