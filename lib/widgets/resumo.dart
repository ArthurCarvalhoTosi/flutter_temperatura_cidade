import 'package:flutter/material.dart';
import 'package:temperatura_cidade/controllers/tema_controller.dart';

class Resumo extends StatelessWidget {
  final String cidade;
  final String descricao;
  final double temperaturaAtual;
  final double temperaturaMaxima;
  final double temperaturaMinima;
  final int numeroIcone;

  const Resumo({
    super.key,
    required this.cidade,
    required this.descricao,
    required this.temperaturaAtual,
    required this.temperaturaMaxima,
    required this.temperaturaMinima,
    required this.numeroIcone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.brightness_6_outlined),
            Switch(
              value: TemaController.instancia.usarTemaEscuro,
              onChanged: (valor) {
                TemaController.instancia.trocarTema();
              },
            ),
          ],
        ),
        Text(
          cidade,
          style: const TextStyle(fontSize: 18),
        ),
        const Padding(padding: EdgeInsets.all(5)),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/$numeroIcone.png'),
              ),
              const Padding(padding: EdgeInsets.all(2)),
              Text(
                '${temperaturaAtual.toStringAsFixed(0)} °C',
                style: const TextStyle(fontSize: 40),
              ),
              const VerticalDivider(
                color: Colors.black,
                thickness: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${temperaturaMaxima.toStringAsFixed(0)} °C'),
                  Text('${temperaturaMinima.toStringAsFixed(0)} °C'),
                ],
              ),
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Text(
          descricao,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
