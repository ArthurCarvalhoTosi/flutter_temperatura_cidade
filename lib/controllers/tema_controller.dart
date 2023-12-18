import 'package:flutter/material.dart';

class TemaController extends ChangeNotifier {
  late bool usarTemaEscuro;
  static TemaController instancia = TemaController();

  TemaController() {
    usarTemaEscuro = false;
  }

  void trocarTema() {
    usarTemaEscuro = !usarTemaEscuro;
    notifyListeners();
  }
}
