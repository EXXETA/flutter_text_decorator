import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/flutter_text_decorator.dart';

class CircleExampleScreen extends StatelessWidget {
  static const String route = '/circle-example';
  const CircleExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Circle Text Examples')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextDecorator.circled(
                style: CircleStyle.basic,
                text: const Text(
                  'Basic Circle',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextDecorator.circled(
                  style: CircleStyle.basic,
                  text: const Text(
                    'Franz jagt im komplett verwahrlosten Taxi quer durch Berlin',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              TextDecorator.circled(
                text: const Text(
                  'Circled Text',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextDecorator.circled(
                  style: CircleStyle.circled,
                  text: const Text(
                    'Franz jagt im komplett verwahrlosten Taxi quer durch Berlin',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
