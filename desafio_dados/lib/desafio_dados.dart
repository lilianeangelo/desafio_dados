// ignore: unused_import
import 'dart:ffi';
import 'dart:math';
import 'dart:io';

/* @author: Liliane Angelo -- data: 22/09/2023 */

/* Iniciando valores nos jogadores */
Map<String, int> jogo = {'jogador1': 0, 'jogador2': 0};

void instrucoes() {
  print("Segue as instruções: \n"
      "Um dos jogadores seleciona quantas rodadas desejam jogar. \n"
      "Em seguida, o sistema vai pedir para que digite R para iniciar o jogo. \n"
      "Serão disponibilizados 3 dados de 6 faces. \n"
      "Ganha o jogador que mais pontuar. \n"
      "Cada jogador terá o direito de executar uma rodada com o dado mágico: \n"
      "Se a face aparecer 0, a pontuação reduzirá pela metade. \n"
      "Se a face aparecer 1, a pontuação será dobrada.");
  print("Boa sorte!!!!");
}

/*método que consiste na inserção de rodadas com valores válidos
--usei o bloco de try/catch caso o usuário insira um caracter diferente que não seja numérico*/
int obterNumeroRodadas() {
  int numeroRodadas;
  while (true) {
    try {
      print("Digite o número de rodadas desejado: ");
      numeroRodadas = int.parse(stdin.readLineSync()!);
      if (numeroRodadas > 0) {
        return numeroRodadas;
      } else {
        print(
            "Digite um número de rodadas válido (maior que zero, não podendo ser negativo)!");
      }
    } catch (e) {
      print("Esse valor fornecido é inválido!");
    }
  }
}

/* Recuperando o número de rodadas para poder sortear*/
int numeroRodadas = obterNumeroRodadas();

void inicializandoRodada() {
  for (int rodada = 1; rodada <= numeroRodadas; rodada++) {
    print('\nRodada $rodada:');
    print('--------------------------------------------------------------\n');
    sortear(jogo, 'jogador1');
    sortear(jogo, 'jogador2');

    //colocar condicional se jogador aceitar dado mágico
  }
}

/*método responsável pelo reconhecimento dos inputs e sorteio*/
void sortear(Map<String, int> jogo, String jogador) {
  /* Iniciando valores dos jogadores com zero */

  final gerador = Random();
  int soma = 0;
  bool jogador1UsouDadoMagico = false;
  bool jogador2UsouDadoMagico = false;

  bool dadoMagico = usarDadoMagico();

  print('$jogador, digite *R* para rodar seus dados: ');
  String input = stdin.readLineSync()!.toUpperCase();

  if (input == "R") {
    print('Valores sorteados para $jogador são: ');

    /*Gerador das faces sorteadas*/
    for (int i = 0; i < 3; i++) {
      int faceDado = gerador.nextInt(6) + 1;
      print('$jogador rolou $iº dado de 6 faces: $faceDado');
      soma += faceDado;
    }
  
     /*Implementação da utilização do dado mágico*/
    if (dadoMagico) {
      if (soma == 0) {
        soma = soma ~/ 2;
        print("Seu valor atual foi aumentado a: $soma");
      } else if (soma == 1) {
        soma *= 2;
        print("Seu valor atual foi reduzido a: $soma");
      }
    }
    jogo[jogador] = soma + soma;
  } else {
    print('Comando inválido. Por favor, digite "R" para rodar os dados.');
  }
}

/*Implementação adicional */
bool usarDadoMagico() {
  print('Deseja usar o dado mágico nesta rodada? (*S* - Sim, *N* - Não)');
  String resposta = stdin.readLineSync()!.toUpperCase();
  return resposta == 'S';

}

void pontuacao(Map<String, int> jogo) {
  List<MapEntry<String, int>> ranking = [];

  ranking = jogo.entries.toList();
  ranking.sort((a, b) => b.value.compareTo(a.value));

  print('\n===*======*====== RANKING DOS JOGADORES ========*=======*======');
  for (int i = 0; i < ranking.length; i++) {
    final player = ranking[i];
    print('${i + 1}º lugar: ${player.key} com ${player.value} pontos.');
  }
}
