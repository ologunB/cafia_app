import 'package:flutter/cupertino.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/text_widgets.dart';

class ReferralTerms extends StatefulWidget {
  @override
  _ReferralTermsState createState() => _ReferralTermsState();
}

class _ReferralTermsState extends State<ReferralTerms> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: 'Referral Terms',
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
          children: [
            regularText(
              'How can you contact us about this policy?',
              fontSize: 25.sp,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 20.h),
            regularText(
              'Sagittis et eu at elementum, quis in. Proin praesent volutpat egestas sociis sit lorem nunc nunc sit. Eget diam curabitur mi ac. Auctor rutrum lacus malesuada massa ornare et. Vulputate consectetur ac ultrices at diam dui eget fringilla tincidunt. Arcu sit dignissim massa erat cursus vulputate gravida id. Sed quis auctor vulputate hac elementum gravida cursus dis.\n\n1. Lectus id duis vitae porttitor enim gravida morbi.\n2. Eu turpis posuere semper feugiat volutpat elit, ultrices suspendisse. Auctor vel in vitae placerat.\n3.Suspendisse maecenas ac donec scelerisque diam sed est duis purus.',
              fontSize: 15.sp,
              height: 1.4,
              color: AppColors.textBlack,
             ),
          ],
        ));
  }
}
