import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helth_io/view/UI/medicine.dart';
import 'package:helth_io/view/UI/my_booking.dart';
import 'package:helth_io/view/utils/app_color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'UI/home.dart';
import 'UI/more.dart';
import 'package:iconsax/iconsax.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Buttom_bar extends StatefulWidget {
  const Buttom_bar({super.key});

  @override
  State<Buttom_bar> createState() => _Buttom_barState();
}

class _Buttom_barState extends State<Buttom_bar> {
  var _currentIndex = 0;
  final List<Widget> _screens = [
    Home(),
    MyBooking(),
    Medicine(),
    More(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black, //New
              blurRadius: 10,
              offset: Offset(4, 8),
            )
          ],
        ),
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              //icon: Icon(Icons.home),
              icon: FaIcon(FontAwesomeIcons.houseMedical),
              title: Text("Home"),
              selectedColor: AppColors.primaryColor,
            ),

            /// AskTutor
            SalomonBottomBarItem(
              icon: FaIcon(FontAwesomeIcons.capsules),
              // icon: Icon(Icons.assignment_ind_rounded),
              title: const Text("Medicine"),
              selectedColor: AppColors.primaryColor,
            ),

            // /// Course
            // SalomonBottomBarItem(
            //   icon: Icon(Iconsax.book_1),
            //   //icon: Icon(Icons.menu_book_rounded),
            //   title: Text("Course"),
            //   selectedColor: AppColors.primarycolor,
            // ),

            /// MyCourse
            SalomonBottomBarItem(
              icon: FaIcon(FontAwesomeIcons.stethoscope),
              // icon: Icon(Icons.assignment_ind_rounded),
              title: const Text("Doctor"),
              selectedColor: AppColors.primaryColor,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.dashboard_customize),
              // icon: Icon(Icons.person),
              title: Text("More"),
              selectedColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
