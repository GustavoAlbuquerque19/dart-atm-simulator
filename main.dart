import 'dart:io'; // Importa biblioteca dart para usar a função de entrada de dados: stdin.readLineSync().

double saldo = 0; //Declara a variável saldo inicialmente como zero.
void main() { //Começa o código.
  bool executar = true; // Declara uma variável booleana como verdadeira. Será útil para encerrar o loop do sistema quando o usuário decidir finalizar.
  while (executar) { //Inicia o loop do sistema com a condição (executar) que significa se executar = verdadeiro. Como o caso é positivo, o loop roda até que executar seja falso.
    print('Sistema de Caixa Eletrônico \n-------------------------------------'); //Exibe uma mensagem na tela.
    int opcao = checarOpcao(); //Chama a função para checar a opção além de declarar uma variável inteira não nula. Ou seja, o resultado de checarOpção só pode ser um valor inteiro não nulo.

    switch (opcao) { //Ler o valor da variável opção e cria casos para cada um desses valores.
      case 1: //Caso 1 - Saldo. Exibe na tela o valor do saldo bancário.
        print('-------------------------------------\nOpção escolhida: Saldo\n');
        print('O saldo atual é: ${saldo.toStringAsFixed(2)} reais.');
        break; // Encerra o caso 1.

      case 2: //Caso 2 - Depositar. Chama a função depositarFunction() que é responsável por fazer o depósito do dinheiro.
        print('-------------------------------------\nOpção escolhida: Depositar\n');
        depositarFunction(); //Chama a função depositar que realiza o depósito. A explicação do funcionamento está mais abaixo.
        break; //Encerra o caso 2.

      case 3: //Caso 3 - Sacar. Chama a função sacarFunction que é responsável por realizar o saque do dinheiro.
        print('-------------------------------------\nOpção escolhida: Saque\n');
        sacarFunction(); //Chama a função sacar que realiza o saque. A explicação do funcionamento está mais abaixo.
        break; //Encerra o caso 3.
    
      case 4: //Caso 4 - Sair. Encerra o sistema.
        print('Encerrando o sistema...');
        executar = false; //A variável executar recebe o valor de falso o que ocasionará no encerramento do loop e finalização do sistema quando o caso 4 for terminado no break;
        break; //Encerra o caso 4.
    }
  } 
}

int checarOpcao() { //Função para checar a opção escolhida pelo usuário.
  int? opcao; //Declara a variável opcao inteira que pode ser nula. O caractere ? indica a possibilidade de um valor nulo, o que permite que o usuário não digite nada no momento da entrada de dados. O objetivo de permitir isso é que não ocorra erro de execução quando um valor inteiro for esperado e o usuário não insira nada.

  while (true) { //Cria um loop while que roda sempre devido a condicional até que seja finalizado pelo return
    print('Digite o número da opção desejada:');
    print('1 - Saldo\n2 - Depositar\n3 - Sacar\n4 - Sair');
    String? entrada = stdin.readLineSync(); //Declara uma variável de texto que pode ser nula e lê a entrada do usuário utilizando a função stdin.readLineSync(); que foi importada no início do código.

    opcao = int.tryParse(entrada ?? ''); //Pega o valor da variável de texto entrada e tenta convertê-lo para inteiro. Caso entrada possua um valor então a conversão acontece, caso contrário o valor atribuído é null. O resultado é atribuído a variável opcao.

    if (opcao != null && opcao >= 1 && opcao <=4) { //Condicional que confere o valor de opcao. Caso opcao não seja vazia e caso opcao seja uma das opções disponíveis dentro de 1 a 4, executa a próxima linha dentro do IF.
      return opcao; //Retorna o valor da varíavel, sendo de 1 a 4. Esse valor retornado é atribuído a variável opcao na função main, o loop while é finalizado e o código prossegue.
    }
    
    print('Opção inválida. Tente novamente.'); //Caso o valor de entrada não esteja dentre as opções possíveis, imprime na tela essa mensagem e repete o loop while.
  }
}

double checarDeposito() { //Função para checar o depósito realizado pelo usuário.
  double? deposito; //Declara a variável deposito como sendo um valor decimal que pode ser nulo.

  while (true) {
    print('Digite o valor que deseja depositar:');
    String? entrada = stdin.readLineSync();
    deposito = double.tryParse(entrada ?? ''); //Assim como na outra função, tenta converter o valor da variável entrada mas nesse caso para o tipo double. Se existir valor então ele é convertido, caso contrário deposito recebe o valor nulo.
    if (deposito != null && deposito > 0) { //Condicional para verificar se o valor do depósito é um valor diferente de vazio e maior que zero. Se sim então o prossegue o código por dentro do IF.
      return deposito; //Retorna à função o valor de deposito, que neste ponto certamente será diferente de zero e nulo, encerrando o loop.
    } //Encerra o IF
    print('Valor inválido. Tente novamente.'); //Caso o valor inserido pelo usuário seja 0 ou nulo, então é exibida na tela essa mensagem e o loop retorna do início.  
  }
}

double depositarFunction() { //Função que realiza o depósito caso o valor do depósito tenha sido validado pela função checarDeposito().
  
  double deposito = checarDeposito(); //Declara a variável deposito como do tipo decimal e a atribui o valor que for retornado pela função checarDeposito().
  saldo += deposito; //Atualiza o valor da variável saldo com o valor que está sendo depositado.
  print('Atualizando saldo...');
  print('Novo saldo é: ${saldo.toStringAsFixed(2)} reais'); //Exibe o saldo bancário atualizado na tela.
  return saldo; //Encerra a função retornando o valor do saldo.
}

double checarSaque() { //Função que verifica se o saque é válido.
  double? saque; //Declara a variável saque como do tipo inteira que pode ser nula.

  while (true) { //Cria um loop while que roda sempre devido a condicional até que seja finalizado pelo return.
    print('Digite o valor que deseja sacar:');
    String? entrada = stdin.readLineSync(); //Declara uma variável de texto que pode ser nula e lê a entrada do usuário.
    saque = double.tryParse(entrada ?? ''); //Pega o valor da variável entrada e tenta convertê-lo para inteiro. Caso entrada possua um valor então a conversão acontece, caso contrário o valor atribuído é null. O resultado é atribuído a variável saque.

    if (saque != null && saque > 0) { //Condicional para verificar se o valor do saque é um valor diferente de vazio e maior que zero. Se sim então o prossegue o código por dentro do IF.
      return saque; //Retorna à função o valor de saque, que neste ponto certamente será diferente de zero e nulo, encerrando o loop.
    }
    
    print('Opção inválida. Tente novamente.'); //Caso o valor inserido pelo usuário seja 0 ou nulo, então é exibida na tela essa mensagem e o loop retorna do início. 
  }
}

double sacarFunction() { //Função que realiza o saque caso o valor do saque tenha sido validado pela função checarSaque().
  while (true) {
    double saque = checarSaque(); //Declara a variável saque como do tipo decimal e a atribui o valor que for retornado pela função checarSaque().

    if (saldo > 0 && saldo >= saque) { //Condicional para verificar se o valor do saldo é maior que zero e se é maior ou igual ao valor do saque. Se sim, então o código prossegue por dentro do if.

      print('Saldo anterior: ${saldo.toStringAsFixed(2)} reais'); //Exibe o saldo antes do saque na tela.
      print('Valor do saque: ${saque.toStringAsFixed(2)} reais'); //Exibe o valor do saque na tela.

      saldo -= saque; //Atualiza o valor do saldo bancário subtraindo o valor do saque.

      print('Processando...');
      print('Saque efetuado com sucesso.');
      print('Saldo atual: ${saldo.toStringAsFixed(2)} reais'); //Exibe o valor do saldo atualizado na tela.

      return saque; //Retrona à função o valor da variável saque.

    } else { //Caso o valor do saque seja diferente da condição do if, executa o seguinte...
      print('Saldo insuficiente. Tente sacar um valor menor.'); //Exibe essa mensagem na tela e repete o loop do início.
    }//Encerra o IF.
  }
}
