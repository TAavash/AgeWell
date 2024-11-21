import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          const Text(
            'Hey Mrs Johnson, ',
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            'Good Afternoon!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Icon(Icons.waving_hand, color: Colors.yellow[700]),
        ],
      ),
    );
  }
}
