import 'package:flutter/material.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 120,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xffFF512F),
            Color(0xffDD2476),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
      ),

      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: const [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "FLASH SALE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height:6),

              Text(
                "Ends in 02:15:20",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),

            ],
          ),

          Icon(
            Icons.local_fire_department,
            color: Colors.white,
            size: 40,
          )

        ],
      ),
    );
  }
}