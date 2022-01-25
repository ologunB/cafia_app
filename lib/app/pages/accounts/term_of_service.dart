import 'package:flutter/cupertino.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/text_widgets.dart';

class TermOfService extends StatefulWidget {
  @override
  _TermOfServiceState createState() => _TermOfServiceState();
}

class _TermOfServiceState extends State<TermOfService> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Terms of Service',
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
          children: [
            regularText(
              'How do we use your information?',
              fontSize: 25.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 20.h),
            regularText(
              'Dolor enim eu tortor urna sed duis nulla. Aliquam vestibulum, nulla odio nisl vitae. In aliquet pellentesque aenean hac vestibulum turpis mi bibendum diam. Tempor integer aliquam in vitae malesuada fringilla.\n\nElit nisi in eleifend sed nisi. Pulvinar at orci, proin imperdiet commodo consectetur convallis risus. Sed condimentum enim dignissim adipiscing faucibus consequat, urna. Viverra purus et erat auctor aliquam. Risus, volutpat vulputate posuere purus sit congue convallis aliquet. Arcu id augue ut feugiat donec porttitor neque. Mauris, neque ultricies eu vestibulum, bibendum quam lorem id. Dolor lacus, eget nunc lectus in tellus, pharetra, porttitor.\n\nIpsum sit mattis nulla quam nulla. Gravida id gravida ac enim mauris id. Non pellentesque congue eget consectetur turpis. Sapien, dictum molestie sem tempor. Diam elit, orci, tincidunt aenean tempus. Quis velit eget ut tortor tellus. Sed vel, congue felis elit erat nam nibh orci.',
              fontSize: 15.sp,
              height: 1.4,
              color: AppColors.textBlack,
             ),
          ],
        ));
  }
}
