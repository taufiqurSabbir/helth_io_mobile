import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Buttom_bar.dart';
import '../utils/app_color.dart';
import '../utils/asset_utils.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTP extends StatefulWidget {
  final String PhoneNumber;
  OTP({super.key, required this.PhoneNumber});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  int CountTime = 120;
  late Timer timer;

  void timerr() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (CountTime > 0) {
          CountTime--;
        } else {
          t.cancel();
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      CountTime = 120; // Reset countTime to its initial value
    });
    timer.cancel(); // Cancel the existing timer
    timerr(); // Start a new timer
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerr();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
    super.dispose();
  }

  TextEditingController OTPinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(

            children: [
              SizedBox(height: 80.h,),
              Image.asset(AssetUtils.logoPng,height: 180.h,width: 500.w,),
              SizedBox(
                height: 7.h,
              ),
              Text(
                'We have send a 4 digit OTP in your this number',
                style: TextStyle(color: Colors.black54, fontSize: 12.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "0${widget.PhoneNumber}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 20.h,
              ),
              Form(
                child: PinCodeTextField(
                  controller: OTPinput,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    inactiveColor: AppColors.primaryColor,
                    activeColor: AppColors.primaryColor,
                    selectedFillColor: Colors.white,
                    selectedColor: AppColors.primaryColor,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  cursorColor: AppColors.primaryColor,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter OTP here';
                    }
                  },
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {});
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),

              SizedBox(
                  width: 350.w,
                  child: ElevatedButton(onPressed: (){
                    if(OTPinput.text.trim().length == 4){
                          Get.to(() => Buttom_bar());


                    }else{
                      Get.snackbar('Warning', 'Enter 4 digit pin');
                    }


                  }, child: Text('Verify',style: TextStyle(color: Colors.white),))),
              SizedBox(
                height: 3.h,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'this code will expare in ',
                      style: TextStyle(color: Colors.grey)),
                  TextSpan(
                      text: '$CountTime s',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold))
                ]),
              ),
              CountTime == 0
                  ? TextButton(
                      onPressed: () {
                        resetTimer();
                      },
                      child: Text(
                        'Resend code',
                        style: TextStyle(color: AppColors.primaryColor),
                      ))
                  : const SizedBox(
                      height: 1,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
