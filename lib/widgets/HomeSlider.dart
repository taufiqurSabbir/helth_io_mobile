import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  ValueNotifier<int> _selected_slider = ValueNotifier(0);
  List items = [
    'https://cdn.10minuteschool.com/images/careers_thumbnail_1693120052577.jpg',
    'https://cdn.10minuteschool.com/images/skills/thumbnails/communication-masterclass-course-by-tahsan-khan-16x9.jpg',
    'https://wikibongo.com/wp-content/uploads/2023/01/best-video-editing-course-with-premiere-pro.webp',
    'https://cdn.10minuteschool.com/images/thumbnails/online-personal-finance-course-thumbnail.jpg',
    'https://i.ytimg.com/vi/MQR7GuU-QP8/maxresdefault.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 163.0,
            autoPlay: true,
            viewportFraction: 1.0, // Set this to 1.0 to occupy full width
            autoPlayInterval: const Duration(seconds: 10),
            onPageChanged: (int page, _) {
              _selected_slider.value = page;
            },
          ),
          items: items.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(i.toString(), fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 5,
        ),
        ValueListenableBuilder(
          valueListenable: _selected_slider,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (int i = 0; i < items.length; i++) {
              list.add(Container(
                width: 10,
                height: 10,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: value == i ? Colors.blue : null,
                ),
              ));
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            );
          },
        )
      ],
    );
  }
}