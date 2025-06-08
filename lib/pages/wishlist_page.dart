import 'package:flutter/material.dart';
import 'package:fluttermart/pages/colors.dart';
import 'package:fluttermart/pages/product_details_page.dart';
import 'package:fluttermart/pages/wishlist_items.dart';
import 'package:google_fonts/google_fonts.dart';

List<WishlistItems> wishListItems = [];

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.transparent,
        titleSpacing: -8,
        title: Text(
          "Wishlist",
          style: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child:
            wishListItems.isEmpty
                ? Center(child: Text('No items Added'))
                : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: wishListItems.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => ProductDetailsPage(
                                  name: wishListItems[index].name,
                                  price: int.parse(wishListItems[index].price),
                                  images: [
                                    wishListItems[index].path,
                                    wishListItems[index].path,
                                    wishListItems[index].path,
                                  ],
                                  description: _generateDescription(
                                    wishListItems[index].name,
                                  ),
                                  rating: _generateRating().toString(),
                                ),
                          ),
                        );
                      },
                      child: wishListProductcard(
                        wishListItems[index].path,
                        wishListItems[index].name,
                        wishListItems[index].price,
                      ),
                    );
                  },
                ),
      ),
    );
  }
}

Widget wishListProductcard(String path, String name, String price) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                child: Image.asset(path, fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '₹ $price',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: MyColors.gold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

String _generateDescription(String name) {
  return "$name premium-quality product crafted with precision and care to elevate your living space. Whether it’s placed in the living room, bedroom, office, or dining area, it blends seamlessly with modern, contemporary, or even traditional décor styles. Built using high-grade materials, it ensures durability, stability, and a long lifespan, making it ideal for both everyday use and special occasions. The design is thoughtfully engineered to combine aesthetics and function, offering not only visual appeal but also practical utility. Its smooth finish, elegant structure, and ergonomic design contribute to a comfortable and luxurious experience. Easy to maintain and resistant to wear and tear, this furniture is perfect for busy households, families, or anyone who appreciates timeless design and reliable quality. Its versatile nature makes it suitable for various interior themes, while its refined craftsmanship highlights attention to detail. Whether you’re furnishing a new home, upgrading your space, or simply adding a functional statement piece, this furniture delivers value, performance, and charm. It’s not just a furnishing item—it’s a reflection of your taste, lifestyle, and commitment to quality living. Bring home this piece today and transform your space into a harmonious blend of comfort and style.";
}

double _generateRating() {
  return 3.5 + (1.5 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000);
}
