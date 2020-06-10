import 'package:flutter/material.dart';

class TextAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String bullet = '\u2022';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              """Conheça o Clinicarx, uma nova forma de gerenciar seus medicamentos ecuidar da sua saúde.

Você sabia que na farmácia você pode encontrar muito mais do que apenasmedicamentos e produtos? Você também pode receber diversos serviços deatendimento à saúde, que vão lhe ajudar a ter uma vida mais simples emais saudável.""",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Com Clinicarx, as farmácias oferecem diversos serviços de saúde:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                  """$bullet Avaliações de saúde e checkups, como pressão arterial e glicose.

$bullet Avaliações para gestão do peso, incluindo medidas corporais e bioimpedância.

$bullet Vacinação e aplicação de injeções.

$bullet Exames rápidos, com apenas uma gota de sangue.

$bullet Acompanhamento do tratamento, com análise de interações medicamentosas e orientação sobre os medicamentos.

$bullet Acompanhamento para parar de fumar.

$bullet Aconselhamento para tratamento de diversos problemas simples de saúde, como gripes, resfriado, problemas de pele, má digestão, entre outros."""),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                """Na próxima vez que precisar de atendimento, lembre-se que na farmácia você pode resolver muitos problemas do seu dia-a-dia.

Para cuidar da sua saúde com mais facilidade e segurança, use os serviços do farmacêutico. Na farmácia ou no consultório, confie em profissionais preparados para lhe ajudar a recuperar e manter sua saúde.

Com ajuda do farmacêutico, você pode obter melhores resultados no tratamento prescrito por seu médico. Além disso, terá um importante aliado para acompanhamento da sua saúde. Muito além de medicamentos, você encontrará apoio, atenção e acompanhamento.

Com o aplicativo do Clinicarx, você terá seus atendimentos de saúde na farmácia, a qualquer momento, em qualquer lugar.""",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Neste aplicativo você encontrará:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                """$bullet Resumos dos seus atendimentos na farmácia, incluindo seus resultados de saúde, para guardar e compartilhar com seu médico e familiares.

$bullet Sua lista completa de medicamentos, muito útil para você consultar durante a consulta médica ou sempre que precisar.

$bullet Sua agenda de atendimentos, incluindo lembretes de retornos à farmácia.

$bullet A lista das farmácias que você frequenta, incluindo endereço e telefone para rápido contato, sempre que precisar.

$bullet Encontre uma nova forma de cuidar da sua saúde e gerenciar seus tratamentos com Clinicarx.""",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Para mais informações, visite nosso site: http://clinicarx.com.br/app',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
