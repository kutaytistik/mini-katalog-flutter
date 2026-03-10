import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        margin: const EdgeInsets.only(right: 12),

        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
            )
          ],
        ),

        child: Row(

          children: [

            Icon(icon, size: 20),

            const SizedBox(width: 8),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            )

          ],

        ),

      ),

    );

  }

}