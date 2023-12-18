import 'package:flutter/material.dart';
import 'package:temperatura_cidade/models/previsao_hora.dart';
import 'package:temperatura_cidade/services/previsao_service.dart';
import 'package:temperatura_cidade/widgets/proximas_temperaturas.dart';
import 'package:temperatura_cidade/widgets/resumo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<PrevisaoHora>> ultimasPrevisoes;

  @override
  void initState() {
    super.initState();
    PrevisaoService service = PrevisaoService();
    ultimasPrevisoes = service.recuperarUltimasPrevisoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Clima Tempo'),
        centerTitle: true,
      ),
      body: Center(
          child: FutureBuilder<List<PrevisaoHora>>(
        future: ultimasPrevisoes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<PrevisaoHora>? previsoes = snapshot.data;
            double temperaturaAtual = previsoes![0].temperatura;
            double menorTemperatura = double.maxFinite;
            double maiorTemperatura = double.negativeInfinity;
            previsoes.forEach((obj) {
              if (obj.temperatura < menorTemperatura) {
                menorTemperatura = obj.temperatura;
              }
              if (obj.temperatura > maiorTemperatura) {
                maiorTemperatura = obj.temperatura;
              }
            });

            String descricao = previsoes[0].descricao;
            int numeroIcone = previsoes[0].numeroIcone;

            return Column(
              children: [
                // ignore: prefer_const_constructors
                Resumo(
                  cidade: 'Roma',
                  descricao: descricao,
                  temperaturaAtual: temperaturaAtual,
                  temperaturaMaxima: maiorTemperatura,
                  temperaturaMinima: menorTemperatura,
                  numeroIcone: numeroIcone,
                ),
                const Padding(padding: EdgeInsets.all(10)),
                ProximasTemperaturas(
                    previsoes: previsoes.sublist(1, previsoes.length))
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('Erro ao carregar as previsões');
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
