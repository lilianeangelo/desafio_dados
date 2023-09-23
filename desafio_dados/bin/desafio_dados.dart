import 'package:desafio_dados/desafio_dados.dart';
// ignore: unused_import
import 'package:desafio_dados/desafio_dados.dart' as desafio_dados;


/* @author: Liliane Angelo -- data: 22/09/2023 */
/* Desafio de Dados - Rodrigo Bossini  */
/* Progarmação para Dispositivos Móveis  */


void main() {
  print('-------------------Batalha de Dados--------------------------\n'
      '-----------------------XX-------XX---------------------------\n');
  print('Vence o jogo quem conseguir pontuar mais em todas as rodadas!\n');

  instrucoes();

  print('--------------------------------------------------------------\n'
      '-----------------------XX-------XX---------------------------\n');

  obterNumeroRodadas();

  print('--------------------------------------------------------------\n');

  inicializandoRodada();

  pontuacao(jogo);
}
