import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favorite_provider.dart';
import '../../widgets/product_card.dart';

class FavoriteScreen extends StatelessWidget {

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favorites = favoriteProvider.favorites;

    return Scaffold(

      appBar: AppBar(
        title: const Text("Favorites"),
      ),

      body: favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorite products",
                style: TextStyle(fontSize: 18),
              ),
            )

          : GridView.builder(

              padding: const EdgeInsets.all(16),

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: .75,

              ),

              itemCount: favorites.length,

              itemBuilder: (context, index) {

                return ProductCard(
                  product: favorites[index],
                );

              },

            ),

    );

  }

}