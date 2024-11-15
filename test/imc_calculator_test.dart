import 'package:test/test.dart';
import '../bin/imc_calculator.dart' as app;

void main() {
  test('calculate_imc', () {
    expect(app.calculateIMC(88, 1.62), 33.53);
  });

  test('calculate_imc com peso zero lançar erro', () {
    expect(() => app.calculateIMC(0, 1.62), throwsArgumentError);
  });

  test('calculate_imc com altura zero lançar erro', () {
    expect(() => app.calculateIMC(88, 0), throwsArgumentError);
  });

  test('Classificar IMC - Magreza grave', () {
    expect(app.imcClassificacao(15), 'Magreza grave');
  });

  test('Classificar IMC - Saudável', () {
    expect(app.imcClassificacao(22), 'Saudável');
  });

  test('Classificar IMC - Sobrepeso', () {
    expect(app.imcClassificacao(27), 'Sobrepeso');
  });

  test('Classificar IMC - Obesidade Grau I', () {
    expect(app.imcClassificacao(32), 'Obesidade Grau I');
  });
}
