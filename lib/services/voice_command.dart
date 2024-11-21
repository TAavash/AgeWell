import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:project/services/localization_service.dart'; // Import LocalizationService

class VoiceCommandService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _languageCode = 'en'; // Default to English

  // Request permission for microphone
  Future<void> requestPermission() async {
    var status = await Permission.microphone.request();
    if (!status.isGranted) {
      print("Microphone permission denied.");
    }
  }

  // Start listening for commands
  Future<void> startListening(BuildContext context) async {
    await requestPermission();

    bool available = await _speech.initialize(
      onStatus: (status) => print('Speech status: $status'),
      onError: (error) => print('Speech error: $error'),
    );

    if (available) {
      // Start listening with the localeId for the selected language
      _speech.listen(
        localeId: _languageCode, // Set the language here
        onResult: (result) {
          String command = result.recognizedWords.toLowerCase();
          _processCommand(context, command);
        },
      );
    }
  }

  // Stop listening for commands
  void stopListening() {
    if (_speech.isListening) {
      _speech.stop();
    }
  }

  // Process the recognized voice command
  void _processCommand(BuildContext context, String command) {
    if (command.contains('heart rate')) {
      Navigator.pushNamed(context, '/checkHeartRate');
    } else if (command.contains('emergency call')) {
      // Trigger emergency call
      print(LocalizationService.translate('emergency_call'));
    } else {
      print('Command not recognized: $command');
    }
  }

  // Check if a language is supported by the SpeechToText package
  Future<bool> isLanguageSupported(String langCode) async {
    List<stt.LocaleName> locales = await _speech.locales();
    return locales.any((locale) => locale.localeId == langCode);
  }

  // Change language for speech recognition and load the corresponding translations
  Future<void> changeLanguage(String langCode) async {
    bool isSupported = await isLanguageSupported(langCode);

    if (isSupported) {
      _languageCode = langCode;
      print('Language changed to: $langCode');
    } else {
      _languageCode = 'en'; // Fallback to English if language is not supported
      print('Language not supported, switching to English.');
    }

    // Load the selected language for translations
    await LocalizationService.loadLanguage(_languageCode);
  }

  Future<void> checkSupportedLanguages() async {
    List<stt.LocaleName> locales = await _speech.locales();
    if (locales.isEmpty) {
      print(
          'No locales available. Ensure the SpeechToText package is initialized correctly.');
    } else {
      for (var locale in locales) {
        print('Supported Locale: ${locale.localeId}');
      }
    }
  }
}
