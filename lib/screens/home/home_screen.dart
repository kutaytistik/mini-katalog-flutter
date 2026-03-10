import 'package:flutter/material.dart';

import '../../services/api_service.dart';
import '../../models/product.dart';

import '../../widgets/product_card.dart';
import '../../widgets/banner_slider.dart';
import '../../widgets/category_chip.dart';
import '../../widgets/top_brands.dart';
import '../../widgets/flash_sale.dart';
import '../../widgets/product_slider.dart';

import '../../core/constants.dart';
import '../category/category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Product>> products;

  List<Product> allProducts = [];
  List<Product> filteredProducts = [];

  SortType currentSort = SortType.priceLow;

  @override
  void initState() {
    super.initState();
    products = ApiService.fetchProducts();
  }

  void search(String query){

    setState(() {

      filteredProducts = allProducts.where((product){

        return product.title
            .toLowerCase()
            .contains(query.toLowerCase());

      }).toList();

    });

  }

  void sortProducts(SortType type){

    setState(() {

      currentSort = type;

      if(type == SortType.priceLow){
        filteredProducts.sort((a,b)=>a.price.compareTo(b.price));
      }

      if(type == SortType.priceHigh){
        filteredProducts.sort((a,b)=>b.price.compareTo(a.price));
      }

      if(type == SortType.name){
        filteredProducts.sort((a,b)=>a.title.compareTo(b.title));
      }

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xfff5f6fa),

      body: SafeArea(

        child: FutureBuilder<List<Product>>(

          future: products,

          builder:(context,snapshot){

            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            allProducts = snapshot.data!;

            if(filteredProducts.isEmpty){
              filteredProducts = allProducts;
            }

            return ListView(

              padding: const EdgeInsets.symmetric(horizontal:20),

              children: [

                const SizedBox(height:10),

                /// HEADER
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: const [

                    Text(
                      "Kutay Store",
                      style: TextStyle(
                        fontSize:28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Icon(Icons.notifications_none)

                  ],

                ),

                const SizedBox(height:20),

                /// SEARCH
                Container(

                  padding: const EdgeInsets.symmetric(horizontal:16),

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

                  child: TextField(

                    onChanged: search,

                    decoration: const InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: "Search products",
                      border: InputBorder.none,
                    ),

                  ),

                ),

                const SizedBox(height:25),

                /// BANNER
                const BannerSlider(),

                const SizedBox(height:20),

                /// FLASH SALE
                const FlashSale(),

                const SizedBox(height:25),

                const SizedBox(height:25),

                /// CATEGORIES
                SizedBox(

                  height:55,

                  child: ListView(

                    scrollDirection: Axis.horizontal,

                    children: [

                      CategoryChip(
                        title: "Phones",
                        icon: Icons.phone_android,
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CategoryScreen(category: "Phones"),
                            ),
                          );
                        },
                      ),

                      CategoryChip(
                        title: "Laptops",
                        icon: Icons.laptop,
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CategoryScreen(category: "Laptops"),
                            ),
                          );
                        },
                      ),

                      CategoryChip(
                        title: "Headphones",
                        icon: Icons.headphones,
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CategoryScreen(category: "Headphones"),
                            ),
                          );
                        },
                      ),

                      CategoryChip(
                        title: "Fashion",
                        icon: Icons.checkroom,
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CategoryScreen(category: "Fashion"),
                            ),
                          );
                        },
                      ),

                      CategoryChip(
                        title: "Accessories",
                        icon: Icons.watch,
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CategoryScreen(category: "Accessories"),
                            ),
                          );
                        },
                      ),

                      CategoryChip(
                        title: "Gaming",
                        icon: Icons.sports_esports,
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const CategoryScreen(category: "Gaming"),
                            ),
                          );
                        },
                      ),

                    ],

                  ),

                ),

                const SizedBox(height:25),

                /// TOP BRANDS
                const Text(
                  "Top Brands",
                  style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height:10),

                const TopBrands(),

                const SizedBox(height:25),

                /// DEAL OF THE DAY
                const Text(
                  "Flash Deals",
                  style: TextStyle(
                    fontSize:22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height:15),

                ProductSlider(products: filteredProducts),

                const SizedBox(height:30),

                /// TRENDING PRODUCTS
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    const Text(
                      "Trending Products",
                      style: TextStyle(
                        fontSize:22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    PopupMenuButton(

                      icon: const Icon(Icons.sort),

                      onSelected:(value){
                        sortProducts(value);
                      },

                      itemBuilder:(context)=>[

                        const PopupMenuItem(
                          value: SortType.priceLow,
                          child: Text("Price Low → High"),
                        ),

                        const PopupMenuItem(
                          value: SortType.priceHigh,
                          child: Text("Price High → Low"),
                        ),

                        const PopupMenuItem(
                          value: SortType.name,
                          child: Text("Name"),
                        ),

                      ],

                    )

                  ],

                ),

                const SizedBox(height:15),

                /// PRODUCT GRID
                GridView.builder(

                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(

                    crossAxisCount:2,
                    crossAxisSpacing:16,
                    mainAxisSpacing:16,
                    childAspectRatio:.72,

                  ),

                  itemCount: filteredProducts.length,

                  itemBuilder:(context,index){

                    return ProductCard(
                      product: filteredProducts[index],
                    );

                  },

                ),

                const SizedBox(height:40),

              ],

            );

          },

        ),

      ),

    );

  }

}