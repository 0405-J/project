import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'doctor_table_screen.dart';
import 'product_list_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor, // Apply branding color
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 35, // Adjust as needed
                ),
                SizedBox(width: 10),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 22, // Larger font size
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          // Menu vertical sur la gauche avec des boutons stylisés
          Container(
            height: screenHeight,
            width: 60,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuButton(
                  icon: FaIcon(FontAwesomeIcons.userDoctor),
                  onPressed: () {
                    _pageController
                        .jumpToPage(0); // Aller à la liste des médecins
                  },
                  tooltip: "Liste des médecins",
                ),
                _buildMenuButton(
                  icon: FaIcon(FontAwesomeIcons.suitcaseMedical),
                  onPressed: () {
                    _pageController
                        .jumpToPage(1); // Aller à la liste des produits
                  },
                  tooltip: "Liste des produits",
                ),
              ],
            ),
          ),
          // Page de contenu
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                DoctorTableScreen(), // Liste des médecins
                ProductListScreen(), // Liste des produits
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom method to build a button with an icon and enhanced style
  Widget _buildMenuButton({
    required FaIcon icon,
    required VoidCallback onPressed,
    required String tooltip,
  }) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      tooltip: tooltip,
      splashColor: AppColors.primaryColor.withOpacity(0.2),
      highlightColor: AppColors.primaryColor.withOpacity(0.2),
      padding: EdgeInsets.all(15),
      iconSize: 35,
      color: AppColors.primaryColor,
    );
  }
}
