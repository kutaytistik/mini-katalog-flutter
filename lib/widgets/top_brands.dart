import 'package:flutter/material.dart';

class TopBrands extends StatelessWidget {
  const TopBrands({super.key});

  @override
  Widget build(BuildContext context) {

    final brands = [
      "Apple",
      "Samsung",
      "Xiaomi",
      "Huawei",
      "Lenovo",
      "HP",
      "Dell",
      "Asus",
      "MSI",
      "Logitech",
      "Razer",
      "Intel",
      "AMD",
      "Zara",
      "Chanel",
      "Guci",
      "So CHIC",
      "Saat Ve Saat",
      "Atasay"
    ];

    return SizedBox(

      height: 70,

      child: ListView.builder(

        scrollDirection: Axis.horizontal,

        itemCount: brands.length,

        itemBuilder: (context,index){

          return Container(

            margin: const EdgeInsets.only(right:12),

            padding: const EdgeInsets.symmetric(horizontal:20),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  blurRadius:6,
                  color: Colors.black12,
                )
              ],
            ),

            child: Center(

              child: Text(
                brands[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),

            ),

          );

        },

      ),

    );

  }
}