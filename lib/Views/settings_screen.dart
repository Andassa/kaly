import 'package:flutter/material.dart';
import 'package:flutter_complete_app/Utils/constants.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool notificationsEnabled = true;
  String selectedLanguage = 'English';

  // Liste des langues disponibles
  final List<String> languages = ['English', 'Français', 'Español', 'Deutsch'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        backgroundColor: kbackgroundColor,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          // Section Compte
          const Text(
            "Account",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(
              Iconsax.user,
              color: kprimaryColor,
            ),
            title: const Text("Profile"),
            subtitle: const Text("View and edit your profile"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Action pour afficher et éditer le profil
            },
          ),
          ListTile(
            leading: const Icon(
              Iconsax.lock,
              color: kprimaryColor,
            ),
            title: const Text("Change Password"),
            subtitle: const Text("Update your password"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Action pour changer le mot de passe
            },
          ),
          const Divider(),

          // Section Notifications
          const Text(
            "Notifications",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          SwitchListTile(
            title: const Text("Enable Notifications"),
            subtitle: const Text("Receive updates and notifications"),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
            secondary: const Icon(
              Iconsax.notification,
              color: kprimaryColor,
            ),
          ),
          const Divider(),

          // Section Confidentialité
          const Text(
            "Privacy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(
              Iconsax.shield,
              color: kprimaryColor,
            ),
            title: const Text("Privacy Policy"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Action pour afficher la politique de confidentialité
            },
          ),
          ListTile(
            leading: const Icon(
              Iconsax.document,
              color: kprimaryColor,
            ),
            title: const Text("Terms and Conditions"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Action pour afficher les termes et conditions
            },
          ),
          const Divider(),

          // Section Thème
          const Text(
            "Display",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          SwitchListTile(
            title: const Text("Dark Mode"),
            subtitle: const Text("Enable dark theme"),
            value: isDarkMode,
            onChanged: (value) {
              setState(() {
                isDarkMode = value;
              });
              // Action pour changer de thème (Mode sombre/Mode clair)
            },
            secondary: const Icon(
              Iconsax.moon,
              color: kprimaryColor,
            ),
          ),
          const Divider(),

          // Section Langue
          const Text(
            "Language",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(
              Iconsax.translate,
              color: kprimaryColor,
            ),
            title: const Text("Language"),
            subtitle: Text(selectedLanguage),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              _showLanguageSelectionDialog();
            },
          ),
          const Divider(),

          // Section A propos
          const Text(
            "About",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: const Icon(
              Iconsax.info_circle,
              color: kprimaryColor,
            ),
            title: const Text("App Version"),
            subtitle: const Text("1.0.0"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
          ListTile(
            leading: const Icon(
              Iconsax.support,
              color: kprimaryColor,
            ),
            title: const Text("Support"),
            subtitle: const Text("Contact us for help"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Action pour contacter le support
            },
          ),
        ],
      ),
    );
  }

  // Boîte de dialogue pour la sélection de la langue
  void _showLanguageSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: DropdownButton<String>(
            value: selectedLanguage,
            isExpanded: true,
            items: languages.map((String language) {
              return DropdownMenuItem<String>(
                value: language,
                child: Text(language),
              );
            }).toList(),
            onChanged: (String? newLanguage) {
              setState(() {
                selectedLanguage = newLanguage ?? selectedLanguage;
              });
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}
