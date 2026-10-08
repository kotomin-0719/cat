import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CatGacha(),
  ));
}

class CatGacha extends StatefulWidget {
  const CatGacha({super.key});

  @override
  State<CatGacha> createState() => _CatGachaState();
}

class _CatGachaState extends State<CatGacha> {
  int n = 0;
  int e = 0;
  bool loading = false;

  final emojis = ['🐱', '🐾', '😺', '✨'];

  final images = [
  'images/nekosan1.webp',
  'images/nekosan2.jpg',
  'images/nekosan3.webp',
  'images/nekosan4.webp',
  'images/nekosan5.webp',
  'images/nekosan6.webp',
  'images/nekosan7.webp',
  'images/nekosan8.webp',
];

  Future<void> gacha() async {
    setState(() {
      loading = true;
    });

    for (int i = 0; i < 10; i++) {
      await Future.delayed(
        const Duration(milliseconds: 100),
      );

      setState(() {
        e = (e + 1) % emojis.length;
      });
    }

    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🐱 Cat Gacha'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: loading
                  ? Center(
                      child: Text(
                        emojis[e],
                        style: const TextStyle(fontSize: 100),
                      ),
                    )
                  : Image.network(
                      images[n],
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 30),
            const Text(
              '🐾',
              style: TextStyle(fontSize: 72),
            ),
            ElevatedButton(
              onPressed: loading ? null : gacha,
              child: const Text('ガチャを回す！'),
            ),
          ],
        ),
      ),
    );
  }
}