import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:temperatura_cidade/widgets/meu_clima_tempo_app.dart';

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MeuClimaTempoApp());
}
