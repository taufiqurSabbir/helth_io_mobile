import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/HomeSlider.dart';
import '../utils/asset_utils.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.h,),
            Image.asset(AssetUtils.logoPng,height: 100.h,width: 130.w,),
            SizedBox(height: 1.h,),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 10, bottom: 25),
          children: [
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            SizedBox(
              height: 1.h,
            ),
            HomeSlider(),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      ),
      ],
    ),
    ),
    );
}}
