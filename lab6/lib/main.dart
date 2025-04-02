import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Калькулятор площади',
      home: AreaCalculator(), 
    );
  }
}

class AreaCalculator extends StatefulWidget {
  const AreaCalculator({super.key});

  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  final _formKey = GlobalKey<FormState>();
  final widthController = TextEditingController();
  final heightController = TextEditingController();
  double area = 0;

  void _calculateArea() {
    if (_formKey.currentState!.validate()) {
      double width = double.parse(widthController.text);
      double height = double.parse(heightController.text);
      setState(() {
        area = width * height;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Площадь: $area (мм²)')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Калькулятор площади'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              TextFormField(
                controller: widthController,
                decoration: const InputDecoration(labelText: 'Ширина (мм)', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите ширину';
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Ширина должна быть положительным числом';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: heightController,
                decoration: const InputDecoration(labelText: 'Высота (мм)', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите высоту';
                  }
                  if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Высота должна быть положительным числом';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Убираем старый результат
                  setState(() {
                    area = 0;
                  });
                  // Вызываем функцию расчета площади
                  _calculateArea();
                },
                child: const Text('Вычислить'),
              ),
              const SizedBox(height: 20),
              Text(
                'S = ${widthController.text.isNotEmpty ? widthController.text : '0'} * ${heightController.text.isNotEmpty ? heightController.text : '0'} = ${area.toStringAsFixed(0)} (мм²)',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}