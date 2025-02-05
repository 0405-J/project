import 'package:flutter/material.dart';
import 'doctor_table_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Use the title passed to HomePage
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add a welcome message or other widgets here
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome to the Doctors App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Add the DoctorTableScreen here
            SizedBox(
              height: 500, // Set a fixed height
              child: DoctorTableScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
