import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final Function onMenuTap;
  const HeaderSection({Key? key, required this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onMenuTap,
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: const Icon(Icons.menu, color: Colors.black54),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LOCATION',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Halal Lab office',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.notifications_none),
          const SizedBox(width: 12),
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              'https://placeholder.svg?height=40&width=40',
            ),
          ),
        ],
      ),
    );
  }
}
