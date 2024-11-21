import 'package:flutter/material.dart';

class PromotionalSection extends StatelessWidget {
  const PromotionalSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Stack(
        children: [
          Positioned(
            right: -50,
            bottom: -20,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.green[100],
            ),
          ),
          Positioned(
            right: 20,
            bottom: -40,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.green[200],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'This app is helpful for getting an appointment with your doctor, hiring a caretaker, contacting emergency services, joining an old age home, etc.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Learn More'),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Image(
                    image: NetworkImage(
                      'https://placeholder.svg?height=150&width=100',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
