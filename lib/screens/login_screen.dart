import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'home.dart'; // Import HomePage

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  void _login(BuildContext context) {
    // Close the keyboard before navigation
    FocusManager.instance.primaryFocus?.unfocus();

    if (_formKey.currentState!.validate()) {
      // Navigate to Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(title: 'BioBox'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800; // Adjust layout for mobile screens

    return Scaffold(
      body: Stack(children: [
        Container(
          color: AppColors.white,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(
                  isMobile ? AppSizes.mobileFormPadding : AppSizes.formPadding),
              child: isMobile
                  ? _buildMobileLayout()
                  : _buildDesktopLayout(), // Responsive layout
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Text(
            "© Développé par E-Pirana",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
      ]),
    );
  }

  /// Mobile Layout: Stack Image above Form
  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 150, // Adjust size
          ),
          const SizedBox(height: AppSizes.fieldSpacing),
          _buildLoginForm(),
        ],
      ),
    );
  }

  /// Desktop Layout: Image on the Left, Form on the Right
  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Left Side - Image
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/logo.png',
              width: 250, // Adjust the logo size for desktop
            ),
          ),
        ),
        // Right Side - Login Form
        Expanded(
          flex: 3,
          child: _buildLoginForm(),
        ),
      ],
    );
  }

  /// Login Form UI
  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.formPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title centered in the page
          Align(
            alignment: Alignment.center,
            child: Text(
              "Bienvenue sur BioBox",
              style: AppTextStyles.welcomeStyle,
            ),
          ),
          const SizedBox(height: 20),
          // Form centered in the page
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextField(
                    _usernameController, "Nom d'utilisateur", Icons.person),
                const SizedBox(height: AppSizes.fieldSpacing),
                _buildTextField(
                  _passwordController,
                  "Mot de passe",
                  Icons.lock,
                  obscureText: _isObscure,
                  hasToggle: true,
                ),
                const SizedBox(height: AppSizes.formPadding),
                _buildLoginButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Custom Text Field
  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool obscureText = false,
    bool hasToggle = false,
  }) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: AppColors.primaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            borderSide:
                BorderSide(color: AppColors.primaryColorLighter, width: 2.0),
          ),
          suffixIcon: hasToggle
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : null,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez entrer $label';
          }

          if (label == "Nom d'utilisateur") {
            if (value.length < 3) {
              return "Le nom d'utilisateur doit comporter au moins 3 caractères.";
            }
            if (!RegExp(r'^[a-zA-Z][a-zA-Z0-9._]+$').hasMatch(value)) {
              return "Nom d'utilisateur invalide (lettres, chiffres, _, .)";
            }
          }

          if (label == "Mot de passe") {
            if (value.length < 8) {
              return "Le mot de passe doit comporter au moins 8 caractères.";
            }
            if (!RegExp(r'[A-Z]').hasMatch(value)) {
              return "Le mot de passe doit contenir au moins une lettre majuscule.";
            }
            if (!RegExp(r'[a-z]').hasMatch(value)) {
              return "Le mot de passe doit contenir au moins une lettre minuscule.";
            }
            if (!RegExp(r'[0-9]').hasMatch(value)) {
              return "Le mot de passe doit contenir au moins un chiffre.";
            }
            if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
              return "Le mot de passe doit contenir un caractère spécial (!@#\$%^&*).";
            }
          }

          return null;
        });
  }

  /// Login Button
  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _login(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.all(AppSizes.buttonPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          ),
        ),
        child: const Text("CONNEXION", style: AppTextStyles.buttonTextStyle),
      ),
    );
  }
}
