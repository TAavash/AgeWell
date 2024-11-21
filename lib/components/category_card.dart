import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isVerified;
  final Color color;
  final String imagePath;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isVerified,
    required this.color,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              imagePath, // Use local asset image
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              if (isVerified) ...[
                const SizedBox(width: 4),
                const Icon(
                  Icons.verified,
                  color: Colors.blue,
                  size: 16,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
