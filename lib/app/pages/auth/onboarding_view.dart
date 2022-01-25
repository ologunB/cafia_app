import 'package:flutter/material.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/auth/start_auth_view.dart';
import 'package:mms_app/app/utils/router.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int _index = 0;

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _index == 0
            ? AppColors.green
            : _index == 1
                ? AppColors.orange
                : Color(0xffFCF2E3),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/map$_index.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                PageView.builder(
                  controller: controller,
                  onPageChanged: (a) {
                    _index = a;
                    setState(() {});
                  },
                  itemCount: items().length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 80.h, right: 30.h, left: 30.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.h),
                              child: Image.asset(
                                  'assets/images/onboard$_index.gif',
                                  width: 310.h),
                            ),
                            SizedBox(height: 35.h),
                            regularText(
                              items()[index].title,
                              fontSize: 37.sp,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                            SizedBox(height: 10.h),
                            regularText(
                              items()[index].desc,
                              fontSize: 15.sp,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white,
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 20.h, right: 30.h, left: 30.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 20.h,
                            margin: EdgeInsets.only(bottom: 20.h),
                            child: ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AnimatedContainer(
                                        width: _index == index ? 18.h : 6.h,
                                        height: 6.h,
                                        duration: Duration(seconds: 1),
                                        margin: EdgeInsets.all(2.h),
                                        decoration: BoxDecoration(
                                            color: _index == index
                                                ? AppColors.white
                                                : AppColors.white
                                                    .withOpacity(.4),
                                            borderRadius:
                                                BorderRadius.circular(30.h)),
                                        padding: EdgeInsets.all(
                                            _index == index ? 0 : 4.h),
                                      )
                                    ],
                                  );
                                }),
                          ),
                          FloatingActionButton(
                            backgroundColor: AppColors.white,
                            onPressed: () {
                              if (_index == 2) {
                                pushReplacement(context, StartAuthView());
                              } else {
                                controller.nextPage(
                                    duration: Duration(seconds: 1),
                                    curve: Curves.easeInOut);
                              }
                            },
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 20.h)
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}

class Item {
  String title;
  String desc;

  Item({required this.title, required this.desc});
}

List<Item> items() {
  return [
    Item(
      title: 'Looking for\nSpecific Commodity?',
      desc:
          'How do you instantly connect to Specific\ncommodity online or offline?',
    ),
    Item(
      title: 'Submit a\nrequest',
      desc:
          'Using the Cafia app, you simply submit a\nrequest, with a title of what you want, or\nwith just a picture.',
    ),
    Item(
      title: 'Request\nreceived',
      desc:
          'And within minutes you get response\nfrom people with your requested need. It’s\nlike making music request on the radio!',
    ),
  ];
}
