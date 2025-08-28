import 'package:flutter/material.dart';
import 'package:fluttermart/pages/cart_screen.dart';
import 'package:fluttermart/pages/colors.dart';
import 'package:fluttermart/pages/discover_page.dart';
import 'package:fluttermart/pages/profile_page.dart';
import 'package:fluttermart/pages/home_page.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentIndex = 0;
  int discoverInitialIndex = 0;

  void onCategoryTap(int categoryIndex) {
    setState(() {
      discoverInitialIndex = categoryIndex;
      currentIndex = 1;
    });
  }

  late final List<Widget> pages = [
    HomePage(onCategoryTap: onCategoryTap),
    DiscoverPage(initialIndex: discoverInitialIndex),
    CartScreen(),
    ProfilePage(),
  ];

  @override
  void didUpdateWidget(covariant CustomNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    pages[1] = DiscoverPage(initialIndex: discoverInitialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF424242),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFFC9A86B),
            unselectedItemColor: Colors.white70,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(HugeIcons.strokeRoundedHome03, size: 28),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.grid_view_rounded, size: 28),
                ),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(HugeIcons.strokeRoundedShoppingCart01, size: 28),
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(HugeIcons.strokeRoundedProfile02, size: 28),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
