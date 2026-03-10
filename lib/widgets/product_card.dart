import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../providers/favorite_provider.dart';
import '../screens/product/product_detail_screen.dart';

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<CartProvider>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    final isFavorite = favoriteProvider.isFavorite(product);

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

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              blurRadius: 12,
              color: Colors.black12,
            )
          ],
        ),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// PRODUCT IMAGE
            Expanded(

              child: Stack(

                children: [

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.network(product.image),
                    ),
                  ),

                  /// FAVORITE BUTTON
                  Positioned(

                    right: 6,
                    top: 6,

                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 6,
                            color: Colors.black12,
                          )
                        ],
                      ),

                      child: IconButton(

                        icon: Icon(
                          isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),

                        onPressed: (){
                          favoriteProvider.toggleFavorite(product);
                        },

                      ),

                    ),

                  ),

                ],

              ),

            ),

            /// PRODUCT TITLE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10),
              child: Text(
                product.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height:4),

            /// PRICE + CART
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text(
                    "\$${product.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),

                  IconButton(

                    icon: const Icon(
                      Icons.add_shopping_cart,
                      color: Colors.deepPurple,
                    ),

                    onPressed: (){

                      cartProvider.add(product);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added to cart"),
                        ),
                      );

                    },

                  )

                ],

              ),
            ),

            const SizedBox(height:6)

          ],

        ),

      ),

    );

  }

}