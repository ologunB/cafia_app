import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mms_app/app/components/buttons.dart';
import 'package:mms_app/app/components/custom_scaffold.dart';
import 'package:mms_app/app/components/custom_textfield.dart';
import 'package:mms_app/app/components/custom_textfield2.dart';
import 'package:mms_app/app/utils/local_storage.dart';
import 'package:mms_app/app/components/snackbar.dart';
import 'package:mms_app/app/components/text_widgets.dart';
import 'package:mms_app/app/pages/accounts/search_cities.dart';
import 'package:mms_app/app/pages/auth/verify_view.dart';
import 'package:mms_app/app/pages/home/main_layout.dart';
import 'package:mms_app/app/utils/country_cities.dart';
import 'package:mms_app/app/utils/router.dart';
import 'package:mms_app/app/utils/utils.dart';

class Signup1View extends StatefulWidget {
  @override
  _Signup1ViewState createState() => _Signup1ViewState();
}

class _Signup1ViewState extends State<Signup1View> {
  TextEditingController country = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool accept = false;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          SizedBox(height: 50.h),
          regularText(
            'Just your phone\nnumber',
            fontSize: 37.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(height: 10.h),
          regularText(
            'Please confirm your country code and enter\nyour phone number',
            fontSize: 15.sp,
            textAlign: TextAlign.center,
            height: 1.8,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          SizedBox(height: 30.h),
          country.text.isNotEmpty
              ? CustomTextField2(
                  title: 'Country',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: country,
                  readOnly: true,
                  onTap: () async {
                    City? res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchCities(),
                      ),
                    );
                    if (res != null) {
                      country.text = res.city + ', ' + res.country;
                      code.text = res.code;
                    }
                    setState(() {});
                  },
                  suffix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.h),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.grey,
                          size: 28.h,
                        ),
                      ),
                    ],
                  ),
                )
              : CustomTextField(
                  hintText: 'Type in your State or Country',
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  controller: country,
                  readOnly: true,
                  onTap: () async {
                    City? res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchCities(),
                      ),
                    );
                    if (res != null) {
                      country.text = res.city + ', ' + res.country;
                      code.text = res.code;
                    }
                    setState(() {});
                  },
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/search.png', height: 16.h)
                    ],
                  ),
                ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: CustomTextField(
                  hintText: '+234',
                  enabled: false,
                  controller: code,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(width: 10.h),
              Expanded(
                flex: 35,
                child: CustomTextField(
                  hintText: 'Phone number',
                  controller: phone,
                  maxLength: 11,
                  textInputType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.done,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              InkWell(
                onTap: () => setState(() => accept = !accept),
                child: Container(
                  height: 20.h,
                  width: 20.h,
                  decoration: BoxDecoration(
                    color: accept ? AppColors.green : null,
                    borderRadius: BorderRadius.circular(10.h),
                    border: Border.all(
                      width: 1.h,
                      color: Color(0xffD0D5DD),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.h),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'I agree to the',
                    style: GoogleFonts.rubik(
                      color: AppColors.textBlack,
                      fontSize: 15.sp,
                    ),
                    children: [
                      TextSpan(
                          text: ' Terms of Use ',
                          style: GoogleFonts.rubik(
                            color: AppColors.green,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                      TextSpan(
                        text: 'and ',
                        style: GoogleFonts.rubik(
                          color: AppColors.textBlack,
                          fontSize: 15.sp,
                        ),
                      ),
                      TextSpan(
                          text: ' Privacy Policy',
                          style: GoogleFonts.rubik(
                            color: AppColors.green,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
          buttonWithBorder(
            'Continue',
            buttonColor: AppColors.orange,
            fontSize: 15.sp,
            height: 56.h,
            busy: isLoading,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
            onTap: () {
              if (country.text.isEmpty || phone.text.isEmpty) {
                errorSnackBar(context, 'Fill all empty fields');
                return;
              }
              if (!accept) {
                errorSnackBar(context, 'Agree to the terms and conditions');
                return;
              }
              verifyNumber(context);
            },
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  bool isLoading = false;

  Future<void> verifyNumber(BuildContext context) async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    setBusy(true);
    Utils.unfocusKeyboard(context);
    final String number =
        "+${code.text}${phone.text.startsWith("0") ? phone.text.substring(1) : phone.text}";
    try {
      await _firebaseAuth .verifyPhoneNumber(
          phoneNumber: number,
          timeout: Duration(minutes: 2),
          verificationCompleted: (PhoneAuthCredential _credential) async {
            try {
              UserCredential result =
                  await _firebaseAuth.signInWithCredential(_credential);
              setBusy(false);
              if (result.additionalUserInfo!.isNewUser) {
                AppCache.setFilledProfile(false);
                pushAndRemoveUntil(context, MainLayout());
              } else {
                AppCache.setFilledProfile(true);
                pushAndRemoveUntil(context, MainLayout());
                return;
              }
            } on FirebaseAuthException catch (e) {
              setBusy(false);
              errorSnackBar(context, e.message!);
            } on PlatformException catch (e) {
              setBusy(false);
              errorSnackBar(context, e.message!);
            } catch (e) {
              setBusy(false);
              errorSnackBar(context, e.toString());
            }

            print('automatically verified');
          },
          verificationFailed: (a) {
            setBusy(false);
            errorSnackBar(context, a.message!);
          },
          codeSent: (String verificationId, forceResendingToken) {
            setBusy(false);
            push(context, VerifyView(verificationId, code.text, phone.text));
          },
          codeAutoRetrievalTimeout: (e) {
            setBusy(false);
            print(3);
          });
    } on PlatformException catch (e) {
      setBusy(false);
      errorSnackBar(context, e.message!);
    } on FirebaseAuthException catch (e) {
      setBusy(false);
      errorSnackBar(context, e.message!);
    } catch (e) {
      setBusy(false);
      errorSnackBar(context, e.toString());
    }
  }

  void setBusy(bool data) {
    setState(() {
      isLoading = data;
    });
  }
}
