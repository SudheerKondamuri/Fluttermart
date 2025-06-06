import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Help & Support',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'Frequently Asked Questions',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            faqItem(
              question: 'How do I place an order?',
              answer:
                  'Browse the products, add them to your cart, and proceed to checkout.',
            ),
            faqItem(
              question: 'How do I track my order?',
              answer:
                  'Go to "My Orders" in your profile to see order status and details.',
            ),
            faqItem(
              question: 'What is the return policy?',
              answer:
                  'You can return items within 30 days of delivery. Check our return policy for more info.',
            ),
            faqItem(
              question: 'How do I contact customer support?',
              answer:
                  'You can reach us via email at support@fluttermart.com or call +1 234 567 890.',
            ),
          ],
        ),
      ),
    );
  }

  Widget faqItem({required String question, required String answer}) {
    return ExpansionTile(
      collapsedBackgroundColor: Colors.grey.shade800,
      backgroundColor: Colors.grey.shade800,
      title: Text(
        question,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(answer, style: const TextStyle(color: Colors.white70)),
        ),
      ],
    );
  }
}
