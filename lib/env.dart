// const bool isProduction = bool.fromEnvironment('dart.vm.product');

import 'package:flutter/material.dart';

const config = {
  'baseUrl': 'https://api.clinicarx.com.br/mobile',
  'cor1': Colors.teal,
  'cor2': Colors.teal,
  'cacheTimeMinutes': 15
};

//Usuario de teste prod
// cpf: 782.226.620-90
// senha: crx12345

//Usuario de teste stage
// CPF: 06647865969
// Senha: beraldo

final environment = config;
