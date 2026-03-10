import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final cartProvider = Provider.of<CartProvider>(context);
    final cart = cartProvider.items;

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Cart"),
      ),

      body: cart.isEmpty

          ? const Center(
              child: Text("Your cart is empty"),
            )

          : Column(

              children: [

                Expanded(

                  child: ListView.builder(

                    itemCount: cart.length,

                    itemBuilder: (context, index) {

                      final item = cart[index];

                      return Card(

                        margin: const EdgeInsets.all(12),

                        child: Padding(

                          padding: const EdgeInsets.all(12),

                          child: Row(

                            children: [

                              Image.network(
                                item.product.image,
                                width: 60,
                              ),

                              const SizedBox(width: 12),

                              Expanded(

                                child: Column(

                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                  children: [

                                    Text(
                                      item.product.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    Text(
                                      "\$${item.product.price}",
                                      style: const TextStyle(
                                        color: Colors.deepPurple,
                                      ),
                                    ),

                                  ],

                                ),

                              ),

                              Row(

                                children: [

                                  IconButton(

                                    icon: const Icon(Icons.remove_circle),

                                    onPressed: () {
                                      cartProvider.decrease(
                                          item.product);
                                    },

                                  ),

                                  Text(
                                    item.quantity.toString(),
                                    style: const TextStyle(fontSize: 18),
                                  ),

                                  IconButton(

                                    icon: const Icon(Icons.add_circle),

                                    onPressed: () {
                                      cartProvider.increase(
                                          item.product);
                                    },

                                  ),

                                ],

                              )

                            ],

                          ),

                        ),

                      );

                    },

                  ),

                ),

                Container(

                  padding: const EdgeInsets.all(20),

                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black12,
                      )
                    ],
                  ),

                  child: Row(

                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [

                      Text(
                        "Total: \$${cartProvider.total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Checkout"),
                      )

                    ],

                  ),

                )

              ],

            ),

    );

  }

}