import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fluttermart/pages/discover_page.dart';
import 'package:fluttermart/pages/search_page.dart';
import 'package:fluttermart/pages/wishlist_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required void Function(int categoryIndex) onCategoryTap,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final images = [
        'assets/images/sofa4.jpg',
        'assets/images/shelf1.jpg',
        'assets/images/lampbg1.png',
        'assets/images/table1.jpg',
        'assets/images/lampbg.jpg',
        'assets/images/sofa1.jpg',
        'assets/images/chair3.jpg',
        'assets/images/table1.jpg',
        'assets/images/shelf1.jpg',
        'assets/images/bed1.jpg',
      ];
      for (var img in images) {
        precacheImage(AssetImage(img), context);
      }
    });
    _pageController.addListener(() {
      final currentPage = _pageController.page?.round() ?? 0;
      if (_currentPage != currentPage) {
        setState(() {
          _currentPage = currentPage;
        });
      }
    });

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      int nextPage = _currentPage + 1;
      if (nextPage > 3) nextPage = 0;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
  });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> categoryWidgets = [
      categoryItem(context, 'assets/images/lamp5.jpg', 'Lamps', 0),
      categoryItem(context, 'assets/images/chair3.jpg', 'Chair', 1),
      categoryItem(context, 'assets/images/bed1.jpg', 'Beds', 2),
      categoryItem(context, 'assets/images/sofa1.jpg', 'Sofa', 3),
      categoryItem(context, 'assets/images/table1.jpg', 'Table', 4),
      categoryItem(context, 'assets/images/shelf1.jpg', 'Shelf', 5),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Fluttermart",
          style: GoogleFonts.poppins(
            fontSize: 28,
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SearchPage()),
              );
            },
            icon: const Icon(FeatherIcons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => WishlistPage()),
              );
            },
            icon: const Icon(FeatherIcons.heart, color: Colors.white),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 500,
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    children: [
                      homePageBannerPages(
                        'assets/images/sofa4.jpg',
                        'New Arrival',
                        'Modern Sofa',
                        'Up to 40% off',
                        3,
                      ),
                      homePageBannerPages(
                        'assets/images/shelf1.jpg',
                        'Organize with',
                        'intention',
                        'Extra 30% off this week',
                        5,
                      ),
                      homePageBannerPages(
                        'assets/images/lampbg1.png',
                        'Life is',
                        'so simple',
                        'This week 25% discount',
                        0,
                      ),
                      homePageBannerPages(
                        'assets/images/table1.jpg',
                        'Crafted for',
                        'modern living',
                        'Luxury picks under 9,999',
                        4,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: 4,
                        effect: WormEffect(
                          dotHeight: 7,
                          dotWidth: 8,
                          dotColor: Colors.white24,
                          activeDotColor: Color(0xFFF5C35D),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: -10,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DiscoverPage(initialIndex: 0),
                        ),
                      );
                    },
                    child: Text(
                      'All >',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return categoryWidgets[index];
              }, childCount: categoryWidgets.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Container homePageBannerPages(
    String imagePath,
    String title1,
    String title2,
    String subtitle,
    int index,
  ) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 250),
            Text(
              title1,
              style: GoogleFonts.poppins(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              title2,
              style: GoogleFonts.poppins(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DiscoverPage(initialIndex: index),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFC9A86B),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  child: Text(
                    'Buy now',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget categoryItem(
  BuildContext context,
  String imageLink,
  String itemName,
  int index,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DiscoverPage(initialIndex: index)),
      );
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          Image.asset(imageLink, fit: BoxFit.cover),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              color: Colors.black54,
              child: Center(
                child: Text(
                  itemName,
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
