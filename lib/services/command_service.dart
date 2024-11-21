import 'dart:convert';
import 'package:flutter/services.dart';

class CommandService {
  // Store the commands for each language
  Map<String, String> commands = {};

  // Load the JSON file for commands
  Future<void> loadCommands() async {
    String jsonString =
        await rootBundle.loadString('lib/voicecommands/commands.arb');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    commands = jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String? getCommand(String key) {
    return commands[key];
  }
}
