import 'package:flutter/material.dart';

class FreeLabel extends StatelessWidget {
  const FreeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 50.0,
      decoration: BoxDecoration(
        color: const Color(0xFF4799EB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'FREE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}