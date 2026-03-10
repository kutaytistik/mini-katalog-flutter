import 'package:flutter/material.dart';

class HeroProduct extends StatelessWidget {
  const HeroProduct({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      height: 170,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [
            Color(0xff4e54c8),
            Color(0xff8f94fb),
          ],
        ),
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.network(
          "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9",
          fit: BoxFit.cover,
        ),
      ),

    );

  }

}