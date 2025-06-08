import 'package:flutter/material.dart';
import 'package:fluttermart/models/product.dart';
import 'package:fluttermart/pages/cart_provider.dart';
import 'package:fluttermart/pages/colors.dart';
import 'package:fluttermart/pages/wishlist_items.dart';
import 'package:fluttermart/pages/wishlist_page.dart';
import 'package:fluttermart/widgets/overlay_helpers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsPage extends StatefulWidget {
  final String name;
  final int price;
  final List<String> images;
  final String description;
  final String rating;

  const ProductDetailsPage({
    super.key,
    required this.name,
    required this.price,
    required this.images,
    required this.description,
    required this.rating,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedColorIndex = 0;
  bool isFavorite = false;

  final PageController _pageController = PageController();

  final List<Color> productColors = [
    Color(0xFFE6B04A),
    Color(0xFF00C6C6),
    Color(0xFFFFFFFF),
  ];
  @override
  void initState() {
    super.initState();
    _checkIfItemInWishlist();
  }

  void _checkIfItemInWishlist() {
    isFavorite = wishListItems.any(
      (item) =>
          item.path == widget.images[0] &&
          item.name == widget.name &&
          item.price == widget.price.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = Product(
      name: widget.name,
      price: widget.price,
      image: widget.images[0],
    );

    return Scaffold(
      backgroundColor: const Color(0xFF1D1B20),
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) => true,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: const Color(0xFF1D1B20),
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  expandedHeight: 350,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        PageView.builder(
                          controller: _pageController,
                          itemCount: widget.images.length,
                          itemBuilder: (_, index) {
                            return ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24),
                              ),
                              child: Image.asset(
                                widget.images[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 20,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: SmoothPageIndicator(
                              controller: _pageController,
                              count: widget.images.length,
                              effect: const ExpandingDotsEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                activeDotColor: Color(0xFFF5C35D),
                                dotColor: Colors.white54,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Transform.translate(
                    offset: const Offset(0, -24),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 100),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1D1B20),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.name,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF2C2C2E),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                      if (isFavorite &&
                                          wishListItems.any(
                                                (item) =>
                                                    item.path ==
                                                        widget.images[0] &&
                                                    item.name == widget.name,
                                              ) ==
                                              false) {
                                        wishListItems.add(
                                          WishlistItems(
                                            path: widget.images[0],
                                            name: widget.name,
                                            price: widget.price.toString(),
                                          ),
                                        );
                                      } else {
                                        wishListItems.removeWhere(
                                          (item) =>
                                              item.name == widget.name &&
                                              item.path == widget.images[0] &&
                                              item.price ==
                                                  widget.price.toString(),
                                        );
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color:
                                        isFavorite
                                            ? Colors.pinkAccent
                                            : Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '₹${widget.price}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: List.generate(
                                  5,
                                  (index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                widget.rating,
                                style: const TextStyle(color: Colors.white70),
                              ),
                              const Spacer(),
                              Row(
                                children: List.generate(productColors.length, (
                                  index,
                                ) {
                                  final color = productColors[index];
                                  return GestureDetector(
                                    onTap: () {
                                      setState(
                                        () => selectedColorIndex = index,
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: color,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color:
                                              selectedColorIndex == index
                                                  ? Colors.white
                                                  : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Description',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.description,
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.gold,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Provider.of<CartProvider>(
                  context,
                  listen: false,
                ).addItem(product);
                showAddToCartOverlay(context, product.name);
              },
              child: Text(
                'Add to cart',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
