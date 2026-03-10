import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {

  final PageController controller = PageController();

  int page = 0;

  final banners = [

    {
      "color": Colors.deepPurple,
      "title": "Mega Sale",
      "subtitle": "Up to 50% discount"
    },

    {
      "color": Colors.orange,
      "title": "Flash Deals",
      "subtitle": "Limited time offers"
    },

    {
      "color": Colors.blue,
      "title": "New Arrivals",
      "subtitle": "Discover the latest products"
    },

  ];

  @override
  void initState() {
    super.initState();
    autoSlide();
  }

  void autoSlide() async {

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    page++;

    if (page >= banners.length) {
      page = 0;
    }

    controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );

    autoSlide();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 170,

      child: PageView.builder(

        controller: controller,

        itemCount: banners.length,

        itemBuilder: (context, index) {

          final banner = banners[index];

          return Container(

            margin: const EdgeInsets.only(right: 10),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: banner["color"] as Color,
            ),

            child: Padding(

              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Text(
                    banner["title"] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    banner["subtitle"] as String,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                ],

              ),

            ),

          );

        },

      ),

    );

  }

}