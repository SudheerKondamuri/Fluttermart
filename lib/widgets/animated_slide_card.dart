import 'package:flutter/material.dart';

class AnimatedSlideCard extends StatefulWidget {
  final String productName;
  final VoidCallback onClose;

  const AnimatedSlideCard({
    super.key,
    required this.productName,
    required this.onClose,
  });

  @override
  State<AnimatedSlideCard> createState() => _AnimatedSlideCardState();
}

class _AnimatedSlideCardState extends State<AnimatedSlideCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _offsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();

    Future.delayed(Duration(seconds: 2), () {
      _controller.reverse().then((_) => widget.onClose());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(Icons.check_circle_outline, color: Color(0xFFC9A86B)),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                '${widget.productName} added to cart!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Color(0xFFC9A86B),
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
