import 'package:flutter/material.dart';

import '../services/voice_command.dart';

class LanguageSelectionDialog extends StatelessWidget {
  final VoiceCommandService _voiceCommandService = VoiceCommandService();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Language'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              _voiceCommandService.changeLanguage('en');
              Navigator.pop(context); // Close the dialog after selecting
            },
          ),
          ListTile(
            title: Text('Español'),
            onTap: () {
              _voiceCommandService.changeLanguage('es');
              Navigator.pop(context); // Close the dialog after selecting
            },
          ),
          ListTile(
            title: Text('Nepali'),
            onTap: () {
              _voiceCommandService.changeLanguage('ne');
              Navigator.pop(context); // Close the dialog after selecting
            },
          ),
        ],
      ),
    );
  }

  // Show the dialog
  static void showLanguageSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => LanguageSelectionDialog(),
    );
  }
}
