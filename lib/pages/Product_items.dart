import 'package:flutter/material.dart';
import 'package:fluttermart/pages/colors.dart';
import 'package:google_fonts/google_fonts.dart';

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
    {"name": "Accent Lamp", "price": 1578, "image": "assets/images/lamp3.jpg"},
    {
      "name": "Rabbit Table Lamp",
      "price": 2599,
      "image": "assets/images/lamp4.jpg",
    },
    {"name": "Tripod Lamp", "price": 1207, "image": "assets/images/lamp5.jpg"},
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
    {"name": "520 Chair", "price": 8999, "image": "assets/images/chair3.jpg"},
    {"name": "Cafe Chair", "price": 8250, "image": "assets/images/chair4.jpg"},
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
      "name": "Upholstered Chair",
      "price": 20807,
      "image": "assets/images/chair7.jpg",
    },
    {
      "name": "Swivel ACcent Chair",
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
      "name": "Vivienne Midi Sofa",
      "price": 51587,
      "image": "assets/images/sofa1.jpg",
    },
    {"name": "Oliver Sofa", "price": 45838, "image": "assets/images/sofa2.jpg"},
    {
      "name": "Velvet 3-Seater Sofa",
      "price": 28424,
      "image": "assets/images/sofa3.jpg",
    },
    {
      "name": "L-Shaped Sofa",
      "price": 49118,
      "image": "assets/images/sofa4.jpg",
    },
    {
      "name": "Modern L-Shaped Sofa",
      "price": 52479,
      "image": "assets/images/sofa5.jpg",
    },
    {
      "name": "Furny L-Shaped SOfa",
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

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.darkGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(product['image'], fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product['name'],
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            '₹${product['price']}',
            maxLines: 1,
            style: TextStyle(
              color: MyColors.gold,
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
