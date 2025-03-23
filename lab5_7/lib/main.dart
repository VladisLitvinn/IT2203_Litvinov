import 'package:flutter/material.dart';
import 'simple_list.dart';
import 'infinity_list.dart';
import 'infinity_math_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lists',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/simple': (context) =>  const SimpleList(),
        '/infinity': (context) => const InfinityList(),
        '/infinity_math': (context) => const InfinityMathList(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Списки'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/simple');
              },
              child: Container(
                color: const Color.fromARGB(255, 181, 215, 242),
                child: const Center(child: Text('Простой список')),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/infinity');
              },
              child: Container(
                color: const Color.fromARGB(255, 181, 215, 242),
                child: const Center(child: Text('Бесконечный список')),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/infinity_math');
              },
              child: Container(
                color: const Color.fromARGB(255, 181, 215, 242),
                child: const Center(child: Text('Бесконечный математический список')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}