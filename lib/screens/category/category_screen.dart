import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {

  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(category),
      ),

      body: Center(
        child: Text(
          "Products in $category",
          style: const TextStyle(fontSize: 22),
        ),
      ),

    );

  }

}