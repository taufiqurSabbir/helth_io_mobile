import 'package:flutter/material.dart';
import 'package:helth_io/view/UI/phone_login.dart';
import 'package:helth_io/view/utils/asset_utils.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});




  @override
  State<Splash_screen> createState() => _Splash_screenState();
}



class _Splash_screenState extends State<Splash_screen> {

  Future<void> NavigationtoLogin() async {


    Future.delayed(const Duration(seconds: 3)).then((_) async {
      Get.to(Phone_Login());

    });

        }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //NavigationtoLogin();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 200.h,),
            Image.asset(AssetUtils.logoPng),

          ],
        ),
      ),
    );
  }
}
