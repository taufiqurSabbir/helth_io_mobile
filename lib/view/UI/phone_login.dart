import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/asset_utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Phone_Login extends StatefulWidget {
  const Phone_Login({super.key});

  @override
  State<Phone_Login> createState() => _Phone_LoginState();
}

class _Phone_LoginState extends State<Phone_Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            Image.asset(AssetUtils.logoPng,height: 180.h,width: 500.w,),
            const SizedBox(height: 20,),
            const SizedBox(height: 20,),
            const Text('Enter your phone number to login',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'BD',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 900.w,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Login',style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      )
    );
  }
}
