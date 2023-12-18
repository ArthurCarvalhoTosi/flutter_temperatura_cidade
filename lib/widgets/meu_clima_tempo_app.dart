import 'package:flutter/material.dart';
import 'package:temperatura_cidade/controllers/tema_controller.dart';
import 'package:temperatura_cidade/widgets/home.dart';

class MeuClimaTempoApp extends StatelessWidget {
  const MeuClimaTempoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: TemaController.instancia,
        builder: (context, child) {
          return  MaterialApp(
            title: 'Meu Clima Tempo',
            theme: TemaController.instancia.usarTemaEscuro 
              ? ThemeData.dark()
              : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        });
  }
}
