import 'dart:ui';
import 'package:flutter/material.dart';
import 'animated_slide_card.dart';

void showAddToCartOverlay(BuildContext context, String productName) {
  final overlay = Overlay.of(context);

  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Stack(
      children: [
        GestureDetector(
          onTap: () => overlayEntry.remove(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.3),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 20,
          right: 20,
          child: AnimatedSlideCard(
            productName: productName,
            onClose: () => overlayEntry.remove(),
          ),
        ),
      ],
    ),
  );

  overlay.insert(overlayEntry);
}
