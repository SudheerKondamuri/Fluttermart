import 'package:fluttermart/pages/item_list.dart';
import 'package:fluttermart/pages/wishlist_page.dart';
import 'Product_items.dart';
import 'Categories_widget.dart';
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

  String _generateDescription(String name) {
    return "$name premium-quality product crafted with precision and care to elevate your living space. Whether it’s placed in the living room, bedroom, office, or dining area, it blends seamlessly with modern, contemporary, or even traditional décor styles. Built using high-grade materials, it ensures durability, stability, and a long lifespan, making it ideal for both everyday use and special occasions. The design is thoughtfully engineered to combine aesthetics and function, offering not only visual appeal but also practical utility. Its smooth finish, elegant structure, and ergonomic design contribute to a comfortable and luxurious experience. Easy to maintain and resistant to wear and tear, this furniture is perfect for busy households, families, or anyone who appreciates timeless design and reliable quality. Its versatile nature makes it suitable for various interior themes, while its refined craftsmanship highlights attention to detail. Whether you’re furnishing a new home, upgrading your space, or simply adding a functional statement piece, this furniture delivers value, performance, and charm. It’s not just a furnishing item—it’s a reflection of your taste, lifestyle, and commitment to quality living. Bring home this piece today and transform your space into a harmonious blend of comfort and style.";
  }

  double _generateRating() {
    return 3.5 + (1.5 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000);
  }

  final List<String> categories = [
    "Lamp",
    "Chair",
    "Bed",
    "Sofa",
    "Table",
    "Shelf",
  ];

  final Map<String, List<Map<String, dynamic>>> productData = {
    "Lamp": [
      {
        "name": "Alberello Floor Lamp",
        "price": 6200,
        "image": "assets/images/lamp1.jpg",
      },
      {
        "name": "Giraffe Table Lamp",
        "price": 2799,
        "image": "assets/images/lamp2.jpg",
      },
      {
        "name": "Accent Lamp",
        "price": 1578,
        "image": "assets/images/lamp3.jpg",
      },
      {
        "name": "Rabbit Table Lamp",
        "price": 2599,
        "image": "assets/images/lamp4.jpg",
      },
      {
        "name": "Tripod Lamp",
        "price": 1207,
        "image": "assets/images/lamp5.jpg",
      },
      {
        "name": "Modern Floor Lamp",
        "price": 1750,
        "image": "assets/images/lamp6.jpg",
      },
    ],
    "Chair": [
      {
        "name": "LIVIN Armchair",
        "price": 9999,
        "image": "assets/images/chair1.jpg",
      },
      {
        "name": "Indowood Chair",
        "price": 2959,
        "image": "assets/images/chair2.jpg",
      },
      {"name": "520 Chair", "price": 899, "image": "assets/images/chair3.jpg"},
      {
        "name": "Cafe Chair",
        "price": 8250,
        "image": "assets/images/chair4.jpg",
      },
      {
        "name": "Accent Chair",
        "price": 10899,
        "image": "assets/images/chair5.jpg",
      },
      {
        "name": "Elm Phoebe Chair",
        "price": 9099,
        "image": "assets/images/chair6.jpg",
      },
      {
        "name": "Upholsted Chair",
        "price": 20897,
        "image": "assets/images/chair7.jpg",
      },
      {
        "name": "Swivel Accent Chair",
        "price": 7139,
        "image": "assets/images/chair8.jpg",
      },
    ],

    "Bed": [
      {
        "name": "Brooklyn Bed Frame",
        "price": 23422,
        "image": "assets/images/bed1.jpg",
      },
      {
        "name": "Divan Set Frame",
        "price": 34202,
        "image": "assets/images/bed2.jpg",
      },
      {
        "name": "Superking Bed Frame",
        "price": 107702,
        "image": "assets/images/bed3.jpg",
      },
      {
        "name": "Mayfair Bed Frame",
        "price": 122402,
        "image": "assets/images/bed4.jpg",
      },
      {
        "name": "Athens Bed Frame",
        "price": 61642,
        "image": "assets/images/bed5.jpg",
      },
      {
        "name": "Oxford Bed Frame",
        "price": 73402,
        "image": "assets/images/bed6.jpg",
      },
    ],

    "Sofa": [
      {
        "name": "Brooklyn Bed Frame",
        "price": 51587,
        "image": "assets/images/sofa1.jpg",
      },
      {
        "name": "Brooklyn Bed Frame",
        "price": 45838,
        "image": "assets/images/sofa2.jpg",
      },
      {
        "name": "Brooklyn Bed Frame",
        "price": 28424,
        "image": "assets/images/sofa3.jpg",
      },
      {
        "name": "Brooklyn Bed Frame",
        "price": 49118,
        "image": "assets/images/sofa4.jpg",
      },
      {
        "name": "Brooklyn Bed Frame",
        "price": 52479,
        "image": "assets/images/sofa5.jpg",
      },
      {
        "name": "Brooklyn Bed Frame",
        "price": 30499,
        "image": "assets/images/sofa6.jpg",
      },
    ],

    "Table": [
      {
        "name": "Ceramic Dining Table",
        "price": 13751,
        "image": "assets/images/table1.jpg",
      },
      {
        "name": "Vegas Light Grey Table",
        "price": 20452,
        "image": "assets/images/table2.jpg",
      },
      {
        "name": "Denver Dining Table",
        "price": 30872,
        "image": "assets/images/table3.jpg",
      },
      {
        "name": "Extendable Table",
        "price": 31973,
        "image": "assets/images/table4.jpg",
      },
    ],

    "Shelf": [
      {
        "name": "Voss-TV & Media Table",
        "price": 11760,
        "image": "assets/images/shelf1.jpg",
      },
      {
        "name": "Brooklyn Bookcase",
        "price": 9800,
        "image": "assets/images/shelf2.jpg",
      },
      {
        "name": "Huntington Shelf",
        "price": 15680,
        "image": "assets/images/shelf3.jpg",
      },
      {
        "name": "Castro Case",
        "price": 29400,
        "image": "assets/images/shelf4.jpg",
      },
      {
        "name": "Vista Display Shelf",
        "price": 12740,
        "image": "assets/images/shelf5.jpg",
      },
      {
        "name": "Vista BedCase",
        "price": 10499,
        "image": "assets/images/shelf6.jpg",
      },
    ],
  };

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
                // Category Buttons
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

                // Product Grid
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
                                          (_) => ListItemPage(
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
