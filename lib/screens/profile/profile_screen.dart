import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xfff5f6fa),

      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView(

        padding: const EdgeInsets.all(20),

        children: [

          /// USER CARD
          Container(

            padding: const EdgeInsets.all(20),

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

            child: Row(

              children: const [

                CircleAvatar(
                  radius:30,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size:30,
                  ),
                ),

                SizedBox(width:15),

                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      "Kutay",
                      style: TextStyle(
                        fontSize:18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height:4),

                    Text(
                      "kutay@email.com",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                  ],

                )

              ],

            ),

          ),

          const SizedBox(height:30),

          /// MENU
          ProfileItem(
            icon: Icons.shopping_bag,
            title: "My Orders",
            onTap: () {},
          ),

          ProfileItem(
            icon: Icons.favorite,
            title: "Favorites",
            onTap: () {},
          ),

          ProfileItem(
            icon: Icons.shopping_cart,
            title: "My Cart",
            onTap: () {},
          ),

          ProfileItem(
            icon: Icons.location_on,
            title: "Shipping Address",
            onTap: () {},
          ),

          ProfileItem(
            icon: Icons.credit_card,
            title: "Payment Methods",
            onTap: () {},
          ),

          ProfileItem(
            icon: Icons.settings,
            title: "Settings",
            onTap: () {},
          ),

          const SizedBox(height:20),

          /// LOGOUT
          ProfileItem(
            icon: Icons.logout,
            title: "Logout",
            onTap: () {},
          ),

        ],

      ),

    );

  }

}

class ProfileItem extends StatelessWidget {

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        margin: const EdgeInsets.only(bottom:12),

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              blurRadius:6,
              color: Colors.black12,
            )
          ],
        ),

        child: Row(

          children: [

            Icon(icon),

            const SizedBox(width:12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize:16,
                ),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size:16,
            )

          ],

        ),

      ),

    );

  }

}