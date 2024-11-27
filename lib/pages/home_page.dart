import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/emergency_contact.dart';
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

  // Logout function
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut(); // Sign out the user
      Navigator.of(context).pushReplacementNamed(
          '/login'); // Navigate to login page (replace with your login screen route)
    } catch (e) {
      // Handle any errors (like network issues)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
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
        child: Container(
          color: Colors.deepPurple[200],
          child: ListView(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.elderly,
                size: 50,
              )),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text("Emergency calls"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EmergencyContactScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {}
                  // Navigator.of(context).push(MaterialPageRoute(
                  //builder: (context) => EmergencyContactScreen()));
                  //  },
                  ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: _logout,
              )
            ],
          ),
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
