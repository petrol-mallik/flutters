import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutters/flutters-game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setPortrait();
    await Flame.device.fullScreen();
  }

  Flame.images.loadAll(<String>[
    'bird-0.png',
    'bird-1.png',
    'bird-0-left.png',
    'bird-1-left.png',
    'cloud-1.png',
    'cloud-2.png',
    'cloud-3.png',
  ]);

  FluttersGame game = FluttersGame();

  RawKeyboard.instance.addListener((RawKeyEvent rawKeyEvent) {
    final space = ' ';
    if (rawKeyEvent.character == space) {
      game.onTapDown(TapDownInfo.fromDetails(game, TapDownDetails()));
    }
  });

  runApp(GameWidget(game: game));
}
