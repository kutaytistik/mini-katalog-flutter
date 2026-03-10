import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../providers/cart_provider.dart';
import '../../providers/favorite_provider.dart';

class ProductDetailScreen extends StatelessWidget {

  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    final isFav = favoriteProvider.isFavorite(product);

    return Scaffold(

      backgroundColor: const Color(0xfff5f6fa),

      appBar: AppBar(
        title: const Text("Product Detail"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Center(
              child: Image.network(
                product.image,
                height: 200,
              ),
            ),

            const SizedBox(height:20),

            Text(
              product.title,
              style: const TextStyle(
                fontSize:22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height:10),

            Text(
              product.description,
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height:20),

            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize:26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

            Row(

              children: [

                IconButton(

                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),

                  onPressed: (){
                    favoriteProvider.toggleFavorite(product);
                  },

                ),

                Expanded(

                  child: ElevatedButton(

                    onPressed: (){

                      cartProvider.add(product);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added to cart"),
                        ),
                      );

                    },

                    child: const Text("Add To Cart"),

                  ),

                ),

              ],

            )

          ],

        ),

      ),

    );

  }

}