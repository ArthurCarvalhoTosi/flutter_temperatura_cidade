import 'package:flutter/material.dart';
import 'package:temperatura_cidade/models/previsao_hora.dart';

class ProximasTemperaturas extends StatelessWidget {
  final List<PrevisaoHora> previsoes;

  const ProximasTemperaturas({super.key, required this.previsoes});

  Card criarCardPrevisoes(int i) {
    return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(image: AssetImage('images/${previsoes[i].numeroIcone}.png')),
                  const Padding(padding: EdgeInsets.all(2)),
                  Text(previsoes[i].horario),
                  const Padding(padding: EdgeInsets.all(5)),
                  Text('${previsoes[i].temperatura.toStringAsFixed(0)}°C'),
                  const Padding(padding: EdgeInsets.all(5)),
                  Expanded(
                    child: Text(
                      previsoes[i].descricao,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          itemCount: previsoes.length,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return criarCardPrevisoes(i);
          },
    ));
  }
}
