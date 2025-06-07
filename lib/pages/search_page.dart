import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _allItems = [
    'Lamp',
    'Chair',
    'Table',
    'Sofa',
    'Shoes',
    'T-Shirt',
    'Mobile',
    'Laptop',
    'Camera',
    'Watch',
  ];
  final List<String> _popularImages = [
    'assets/images/bed4.jpg',
    'assets/images/sofa6.jpg',
    'assets/images/lamp2.jpg',
    'assets/images/table4.jpg',
  ];
  List<String> _searchResults = [];

  void _onSearchChanged(String query) {
    setState(() {
      _searchResults =
          _allItems
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  void _navigateToCategory(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => Scaffold(
              appBar: AppBar(
                title: Text(category, style: GoogleFonts.poppins()),
                backgroundColor: Colors.black,
              ),
              backgroundColor: Colors.black,
              body: Center(
                child: Text(
                  'Items in $category',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: TextField(
          controller: _controller,
          onChanged: _onSearchChanged,
          style: GoogleFonts.poppins(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search items...',
            hintStyle: GoogleFonts.poppins(color: Colors.white54),
            filled: true,
            fillColor: Colors.grey.shade800,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 0,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_controller.text.isEmpty) ...[
              Text(
                'Popular Items',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                itemCount: _popularImages.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (_, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(_popularImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Popular Categories',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children:
                    [
                      'Sofas',
                      'Tables',
                      'Lamps',
                      'Chairs',
                      'shelfs',
                      'Furniture'
                    ].map((category) {
                      return GestureDetector(
                        onTap: () => _navigateToCategory(category),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            category,
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ],
            if (_controller.text.isNotEmpty) ...[
              const SizedBox(height: 20),
              Text(
                'Search Results',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 12),
              ..._searchResults.map(
                (item) => ListTile(
                  title: Text(
                    item,
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  leading: const Icon(
                    Icons.shopping_bag,
                    color: Colors.white70,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white24,
                    size: 16,
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
