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
              question: 'Can I cancel my order?',
              answer:
                  '''Yes, orders can be canceled before they are shipped. 
                  Visit "My Orders" to request cancellation.''',
            ),
            faqItem(
              question: 'Do you offer international shipping?',
              answer:
                  'Currently, we ship only within India. Stay tuned for international delivery updates.',
            ),
            faqItem(
              question: 'What payment methods are accepted?',
              answer:
                  'We accept UPI, credit/debit cards, net banking, and wallet payments.',
            ),
            faqItem(
              question: 'Is my payment information secure?',
              answer:
                  '''Yes, all payments are processed through secure, 
                  encrypted gateways to ensure your safety.''',
            ),
            faqItem(
              question: 'Do I need an account to place an order?',
              answer:
                  '''Yes, you need to create an account to manage orders, track shipments,
                   and access support.''',
            ),
            faqItem(
              question: 'How can I update my shipping address?',
              answer:
                  '''Go to your profile settings, then tap on "Address Book" 
                  to edit or add new addresses.''',
            ),
            faqItem(
              question: 'What if I received a damaged item?',
              answer:
                  '''Please report the issue within 48 hours of delivery with photos. 
                  We’ll assist with a replacement or refund.''',
            ),
            faqItem(
              question: 'How long does delivery take?',
              answer:
                  'Standard delivery takes 3–7 business days, depending on your location.',
            ),
            faqItem(
              question: 'Can I schedule delivery?',
              answer:
                  '''Currently, scheduled delivery is not supported. 
                  We’ll notify you as soon as your order is shipped.''',
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
