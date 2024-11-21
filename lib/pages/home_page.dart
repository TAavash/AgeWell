import 'package:flutter/material.dart';
import 'package:project/pages/user_profile.dart';
import '../components/bottom_navbar.dart';
import 'health_monitor.dart';
import '../components/categories.dart';
import '../components/header_section.dart';
import '../components/greeting_section.dart';
import '../components/search_bar.dart';
import '../components/promotional_section.dart';
//import '../components/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Method to handle navigation tab changes
  void _onNavTap(int index) {
    setState(() {
      print("Current index: $index");
      _currentIndex = index;
    });
  }

  // open menu drawer
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    // List of pages to navigate between
    final List<Widget> _pages = [
      Column(
        children: [
          HeaderSection(onMenuTap: _openDrawer),
          SizedBox(height: 16),
          GreetingSection(),
          SizedBox(height: 16),
          SearchBarSection(),
          SizedBox(height: 16),
          CategoriesSection(),
        ],
      ),
      const HeartRateScreen(),
      const Center(child: Text('Shop Page')),
      const ProfilePage(),
    ];
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset:
          false, // Prevent screen resize when keyboard appears
      backgroundColor: Colors.grey[50],

      // Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Age Well',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Emergency Contacts'),
              onTap: () {
                // Handle item tap
                //Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Handle item tap
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // Main Body Content with Stack
      body: SafeArea(
        child: Stack(
          children: [
            // Main content based on the selected tab
            _pages[_currentIndex],

            // Promotional Section at the bottom right above the Navbar
            if (_currentIndex == 0)
              const Positioned(
                right: 16,
                bottom: 80,
                child: PromotionalSection(),
              ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
