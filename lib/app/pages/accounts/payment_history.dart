import 'package:flutter/material.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/text_widgets.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Payment History',
      removeImage: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return InkWell(
              child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.h),
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 9.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.h),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userNameText(
                      'Payment Title',
                      fontSize: 17.sp,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 4.h),
                    userNameText(
                      'Payment desc',
                      fontSize: 14.sp,
                      color: AppColors.textBlack,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
