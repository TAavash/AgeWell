import 'package:flutter/material.dart';
import 'category_card.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'All Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle "See All" functionality   see all opens detaied category page
                },
                child: const Row(
                  children: const [
                    Text('See All'),
                    Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Categories List
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding:
                  const EdgeInsets.only(left: 16.0), // Indent for list items
              children: [
                CategoryCard(
                  title: 'Doctor',
                  subtitle: 'Consult',
                  isVerified: true,
                  color: Colors.lightGreen[100]!,
                  imagePath: 'lib/images/doctor.png',
                ),
                const SizedBox(width: 16),
                CategoryCard(
                  title: 'Caretaker',
                  subtitle: 'Hire',
                  isVerified: true,
                  color: Colors.orange[100]!,
                  imagePath: 'assets/images/caretaker.png',
                ),
                const SizedBox(width: 16),
                CategoryCard(
                  title: 'Old Age Home',
                  subtitle: 'Join',
                  isVerified: false,
                  color: Colors.blue[100]!,
                  imagePath: 'assets/images/home.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
