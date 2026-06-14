import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Kesehatan'),
        backgroundColor: const Color(0xFF7ED5A0),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Color(0xFF7ED5A0),
            ),
            Text('Halaman Video Kesehatan'),
          ],
        ),
      ),
    );
  }
}
