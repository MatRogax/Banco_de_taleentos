import 'package:flutter_test/flutter_test.dart';
import 'package:banco_de_talentos_flutter/core/utils/validators.dart';

void main() {
  group('Validators Test', () {
    test('validateEmail should return error for invalid emails', () {
      expect(Validators.validateEmail(''), 'E-mail é obrigatório');
      expect(Validators.validateEmail('invalid'), 'Insira um e-mail válido');
      expect(Validators.validateEmail('invalid@'), 'Insira um e-mail válido');
      expect(Validators.validateEmail('invalid@domain'), 'Insira um e-mail válido');
      expect(Validators.validateEmail('valid@domain.com'), isNull);
    });

    test('validatePassword should return error for short passwords', () {
      expect(Validators.validatePassword(''), 'Senha é obrigatória');
      expect(Validators.validatePassword('123'), 'A senha deve ter pelo menos 6 caracteres');
      expect(Validators.validatePassword('123456'), isNull);
    });

    test('validateCPF should return error for invalid CPFs', () {
      expect(Validators.validateCPF(''), 'CPF é obrigatório');
      expect(Validators.validateCPF('123'), 'CPF deve conter 11 dígitos');
      expect(Validators.validateCPF('11111111111'), 'CPF inválido');
      // A valid CPF for testing: 12345678909 (invalid checksum) vs a mathematically valid one.
      // Let's test a valid CPF checksum: 000.000.000-00 (is invalid because same digit), 
      // 123.456.789-09 is mathematically valid? Let's check:
      // digits: 1 2 3 4 5 6 7 8 9
      // sum1 = 1*10 + 2*9 + 3*8 + 4*7 + 5*6 + 6*5 + 7*4 + 8*3 + 9*2 = 10 + 18 + 24 + 28 + 30 + 30 + 28 + 24 + 18 = 210
      // 210 % 11 = 1
      // 11 - 1 = 10 -> digit 0
      // digits: 1 2 3 4 5 6 7 8 9 0
      // sum2 = 1*11 + 2*10 + 3*9 + 4*8 + 5*7 + 6*6 + 7*5 + 8*4 + 9*3 + 0*2 = 11 + 20 + 27 + 32 + 35 + 36 + 35 + 32 + 27 + 0 = 295
      // 295 % 11 = 9
      // 11 - 9 = 2 -> digit 9
      // So 12345678909 is mathematically valid! Let's test it:
      expect(Validators.validateCPF('12345678909'), isNull);
      expect(Validators.validateCPF('123.456.789-09'), isNull);
      expect(Validators.validateCPF('12345678900'), 'CPF inválido');
    });
  });
}
