import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/GameScreen/game_screen.dart';
import 'package:flutter_auth/services/game_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GameProvider())],
      child: const GameScreen(),
    ));
  }
}
