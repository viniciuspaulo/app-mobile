import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

validacaoStringNotNull({String valor, String mensagem}) {
  if (valor == null || valor.length == 0) {
    return mensagem;
  }
  return null;
}

validacaoStringNotNullLimit({String valor, String mensagem, int limit = 0}) {
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
  } else if (valor.length != 10) {
    return "O celular deve ter 10 dígitos";
  } else if (!regExp.hasMatch(valor)) {
    return "O número do celular so deve conter dígitos";
  }
  return null;
}

String validacaoEmail(String valor) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (valor.length == 0) {
    return "Informe o Email";
  } else if (!regExp.hasMatch(valor)) {
    return "Email inválido";
  } else {
    return null;
  }
}

String somenteNumeros(String valor) {
  return valor.replaceAll('-', '').replaceAll('.', '');
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

gteKetRandom() {
  Random random = new Random();
  return random.nextInt(999999999);
}

Image imageFromBase64String(
    {String base64String, double width, double height}) {
  return Image.memory(
    base64Decode(base64String),
    width: width,
    height: height,
  );
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String base64String(Uint8List data) {
  return base64Encode(data);
}

getAge(Jiffy birthday) {
  if (birthday == null) {
    return "";
  }
  Duration dur = DateTime.now().difference(birthday.dateTime);
  return (dur.inDays / 365).floor().toString();
}

String dateParserUs(String valor) {
  List<String> dataList = valor.split("/");
  if (dataList.length > 0) {
    return dataList[2] + "-" + dataList[1] + "-" + dataList[0];
  }
  return valor;
}
