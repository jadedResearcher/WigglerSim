import 'dart:html';
import 'package:DollLibCorrect/DollRenderer.dart';
import 'dart:async';
import '../GameShit/GameObject.dart';
import "navbar.dart";
GameObject game;

void main() {
    loadNavbar();

    game = new GameObject();
    start();
}


Future<Null> start() async {
    await game.preloadManifest();
    //TODO load all static items, display
}