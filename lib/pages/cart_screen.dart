import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
// import 'models/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'order_successful_popup.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final isCartEmpty = cart.items.isEmpty;
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My cart',
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.asset(item.image, fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '₹ ${item.price}',
                                style: TextStyle(
                                  color: Color(0xFFC9A86B),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            button('-', () => cart.decreaseQty(item)),
                            SizedBox(width: 8),
                            Text(
                              '${item.quantity}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(width: 8),
                            button('+', () => cart.increaseQty(item)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  '₹ ${cart.total}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
    style: ElevatedButton.styleFrom(
                      backgroundColor: isCartEmpty ? Colors.grey[800] : const Color(0xFFC9A86B),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: isCartEmpty
                        ? null
                        : () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (_) => const OrderSuccessPopup(),
                            );
                            Future.delayed(const Duration(milliseconds: 100), () {
                              Provider.of<CartProvider>(context, listen: false).clearCart();
                            });
                          },
                    child: Text(
                      isCartEmpty ? 'No items in cart' : 'Place Order',
                      style: TextStyle(
                        color: isCartEmpty ? const Color(0xFFC9A86B) : Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(String label, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey[850],
      ),
      child: IconButton(
        icon: Text(label, style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: onPressed,
      ),
    );
  }
}
