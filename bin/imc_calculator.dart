import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:imc_calculator/classes/Pessoa.dart';

void main(List<String> arguments) {
  var pessoa = Pessoa();
  print("Digite seu nome:");
  var nome = stdin.readLineSync(encoding: utf8);
  pessoa.setNome(nome.toString());
  print("Digite sua altura em metros:");
  var altura = getDouble();
  pessoa.setAltura(altura);
  print("Digite seu peso em kg:");
  var peso = getDouble();
  pessoa.setPeso(peso);
  double imc = calculateIMC(pessoa.getPeso(), pessoa.getAltura());
  String classificacao = imcClassificacao(imc);
  print(
      "Olá $nome \nSeu imc é de: $imc \nSua classificação é de: $classificacao");
}

double getDouble() {
  var value = stdin.readLineSync(encoding: utf8);
  var convertedValue = double.tryParse(value.toString());
  if (convertedValue == null) {
    throw ArgumentError("Valor inválido");
  }

  return convertedValue;
}

double calculateIMC(double peso, double altura) {
  if (peso <= 0 || altura <= 0) {
    print(peso);
    print(altura);
    throw ArgumentError("Valores inválidos");
  }
  double imc = peso / pow(altura, 2);

  return double.parse(imc.toStringAsFixed(2));
}

String imcClassificacao(double imc) {
  var clas = "Saudável";

  if (imc < 16) {
    clas = "Magreza grave";
  } else if (imc >= 16 && imc < 17) {
    clas = "Magreza moderada";
  } else if (imc >= 17 && imc < 18.5) {
    clas = "Magreza leve";
  } else if (imc >= 18.5 && imc < 25) {
    clas = "Saudável";
  } else if (imc >= 25 && imc < 30) {
    clas = "Sobrepeso";
  } else if (imc >= 30 && imc < 35) {
    clas = "Obesidade Grau I";
  } else if (imc >= 35 && imc < 40) {
    clas = "Obesidade Grau II";
  } else if (imc <= 40) {
    clas = "Obesidade Grau III";
  }

  return clas;
}
