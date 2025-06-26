import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/flutter_text_decorator.dart';

class BoxExampleScreen extends StatelessWidget {
  static const String route = '/box-example';
  const BoxExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Box Text Examples')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextDecorator.boxed(
                style: BoxStyle.rounded,
                text: const Text(
                  'Rounded Box',
                  style: TextStyle(fontSize: 32),
                ),
                strokeWidth: 2,
              ),
              const SizedBox(height: 32),
              TextDecorator.boxed(
                style: BoxStyle.rounded,
                text: const Text(
                  'Franz jagt im komplett verwahrlosten Taxi quer durch Berlin',
                  style: TextStyle(fontSize: 32),
                ),
                strokeWidth: 2,
              ),
              const SizedBox(height: 32),
              TextDecorator.boxed(
                style: BoxStyle.bubble,
                text: const Text(
                  'Bubble Text 2',
                  style: TextStyle(fontSize: 32),
                ),
                strokeWidth: 2,
                borderRadius: 16,
              ),
              const SizedBox(height: 32),
              TextDecorator.boxed(
                style: BoxStyle.bubble,
                text: const Text(
                  'Franz jagt im komplett verwahrlosten Taxi quer durch Berlin',
                  style: TextStyle(fontSize: 16),
                ),
                strokeWidth: 2,
                borderRadius: 16,
              ),
              const SizedBox(height: 32),
              TextDecorator.boxed(
                style: BoxStyle.curled,
                text: const Text(
                  'Curled Box',
                  style: TextStyle(fontSize: 16),
                ),
                strokeWidth: 2,
                borderRadius: 16,
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextDecorator.boxed(
                  style: BoxStyle.curled,
                  text: const Text(
                    'Franz jagt im komplett verwahrlosten Taxi quer durch Berlin',
                    style: TextStyle(fontSize: 16),
                  ),
                  strokeWidth: 2,
                  borderRadius: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
