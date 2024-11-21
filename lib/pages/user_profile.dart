import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Compute size dynamically here

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProfileSection(size),
                const SizedBox(height: 40),
                _buildAppointmentsSection(),
                const SizedBox(height: 40),
                _buildRecordsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection(Size size) {
    return Container(
      width: size.width / 0.5,
      height: 400,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage:
                  NetworkImage('https://placeholder.svg?height=100&width=100'),
            ),
          ),
          const SizedBox(height: 20),
          const Text("Full Name"),
          const Text(
            'Sithum Suraweera',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text("Email Address"),
          const Text(
            'sithumsuraweera01@gmail.com',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text("Phone Number"),
          const Text(
            '071 263 9494',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Edit Details'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'My Appointments',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          const SizedBox(height: 10),
          _buildAppointmentTile('Dr. Nathali Fernando', 'Feb 22', '16:00'),
        ],
      ),
    );
  }

  Widget _buildAppointmentTile(String doctor, String date, String time) {
    return Container(
      margin:
          const EdgeInsets.symmetric(vertical: 10), // Space around each tile
      padding: const EdgeInsets.all(12), // Inner padding for the content
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Rounded corners
        border: Border.all(color: Colors.blue, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ), // Border styling
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.person, color: Colors.blue),
        title: Text(
          doctor,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text('Clinical Psychology'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(date,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(time),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordsSection() {
    return Row(
      children: [
        Expanded(
          child: _buildRecordCard('Medical Record', 'Dr. Prabashi Rathnayake'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildRecordCard('Prescriptions', 'Jan 12 - Psychology'),
        ),
      ],
    );
  }

  Widget _buildRecordCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 10),
          Text(subtitle),
        ],
      ),
    );
  }
}
