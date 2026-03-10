import 'package:flutter/material.dart';
import 'dart:async';

class FlashDealsTimer extends StatefulWidget {
  const FlashDealsTimer({super.key});

  @override
  State<FlashDealsTimer> createState() => _FlashDealsTimerState();
}

class _FlashDealsTimerState extends State<FlashDealsTimer> {

  int seconds = 3600;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds:1),(t){

      if(seconds>0){
        setState(() {
          seconds--;
        });
      }

    });

  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int h = seconds ~/ 3600;
    int m = (seconds % 3600) ~/ 60;
    int s = seconds % 60;

    return Row(

      children: [

        const Icon(Icons.flash_on,color:Colors.orange),

        const SizedBox(width:6),

        Text(
          "$h:$m:$s",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        )

      ],

    );

  }

}