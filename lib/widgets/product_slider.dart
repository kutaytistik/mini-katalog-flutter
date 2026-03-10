import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product/product_detail_screen.dart';

class ProductSlider extends StatelessWidget {

  final List<Product> products;

  const ProductSlider({super.key, required this.products});

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 220,

      child: ListView.builder(

        scrollDirection: Axis.horizontal,

        itemCount: products.length,

        itemBuilder: (context,index){

          final product = products[index];

          return GestureDetector(

            onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );

            },

            child: Container(

              width: 160,
              margin: const EdgeInsets.only(right:16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius:10,
                    color: Colors.black12,
                  )
                ],
              ),

              child: Padding(

                padding: const EdgeInsets.all(12),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Expanded(
                      child: Image.network(product.image),
                    ),

                    const SizedBox(height:8),

                    Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height:4),

                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    )

                  ],

                ),

              ),

            ),

          );

        },

      ),

    );

  }

}