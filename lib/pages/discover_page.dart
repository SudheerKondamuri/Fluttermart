import 'package:fluttermart/pages/product_details_page.dart';
import 'package:fluttermart/pages/wishlist_page.dart';
import 'Product_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';

class DiscoverPage extends StatefulWidget {
  final int initialIndex;
  const DiscoverPage({super.key, required this.initialIndex});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  final List<String> categories = [
    "Lamp",
    "Chair",
    "Bed",
    "Sofa",
    "Table",
    "Shelf",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    String currentCategory = categories[selectedIndex];
    List<Map<String, dynamic>> products = productData[currentCategory] ?? [];

    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 0, left: 5),
          child: Text(
            'Discover',
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10, top: 0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => WishlistPage()),
                );
              },
              icon: Icon(FeatherIcons.heart, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final isSelected = selectedIndex == index;
                        return GestureDetector(
                          onTap: () => setState(() => selectedIndex = index),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? const Color(0xFFC9A86B)
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              categories[index],
                              style: GoogleFonts.poppins(
                                color:
                                    isSelected
                                        ? Colors.white
                                        : Colors.grey[400],
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Expanded(
                  child:
                      products.isEmpty
                          ? const Center(
                            child: Text(
                              'No products available',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                              ),
                            ),
                          )
                          : GridView.builder(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: screenWidth > 600 ? 3 : 2,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                  childAspectRatio:
                                      screenWidth > 600 ? 0.8 : 0.75,
                                ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => ProductDetailsPage(
                                            name: product['name'],
                                            price: product['price'],
                                            description: _generateDescription(
                                              product['name'],
                                            ),
                                            rating: _generateRating()
                                                .toStringAsFixed(1),
                                            images: List.generate(
                                              3,
                                              (_) => product['image'],
                                            ),
                                          ),
                                    ),
                                  );
                                },
                                child: ProductCard(product: product),
                              );
                            },
                          ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

String _generateDescription(String name) {
  return "$name premium-quality product crafted with precision and care to elevate your living space. Whether it’s placed in the living room, bedroom, office, or dining area, it blends seamlessly with modern, contemporary, or even traditional décor styles. Built using high-grade materials, it ensures durability, stability, and a long lifespan, making it ideal for both everyday use and special occasions. The design is thoughtfully engineered to combine aesthetics and function, offering not only visual appeal but also practical utility. Its smooth finish, elegant structure, and ergonomic design contribute to a comfortable and luxurious experience. Easy to maintain and resistant to wear and tear, this furniture is perfect for busy households, families, or anyone who appreciates timeless design and reliable quality. Its versatile nature makes it suitable for various interior themes, while its refined craftsmanship highlights attention to detail. Whether you’re furnishing a new home, upgrading your space, or simply adding a functional statement piece, this furniture delivers value, performance, and charm. It’s not just a furnishing item—it’s a reflection of your taste, lifestyle, and commitment to quality living. Bring home this piece today and transform your space into a harmonious blend of comfort and style.";
}

double _generateRating() {
  return 3.5 + (1.5 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000);
}
