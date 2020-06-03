


import 'dart:math';

import 'package:flutter/material.dart';

validacaoStringNotNull({String valor, String mensagem, int limit = 0}) {
  if (valor == null || valor.length == 0) {
    return mensagem;
  }
  if (valor.length < limit) {
    return "Minimo de $limit caracteres.";
  }
  return null;
}


 String validacaoCelular(String valor) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (valor.length == 0) {
      return "Informe o celular";
    } else if(valor.length != 10){
      return "O celular deve ter 10 dígitos";
    }else if (!regExp.hasMatch(valor)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
  }

  String validacaoEmail(String valor) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (valor.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(valor)){
      return "Email inválido";
    }else {
      return null;
    }
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  gteKetRandom() {
    Random random = new Random();
    return random.nextInt(999999999);
  }