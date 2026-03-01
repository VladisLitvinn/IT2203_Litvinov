import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  const SimpleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список элементов')),
      body: ListView(
        children: const [
          ListTile(title: Text('Элемент 1')),
          ListTile(title: Text('Элемент 2')),
          ListTile(title: Text('Элемент 3')),
        ],
      ),
    );
  }
}