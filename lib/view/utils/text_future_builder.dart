import 'package:flutter/material.dart';
import 'package:winemaker/view/constants.dart';

FutureBuilder<String> getTextFutureBuilder(
    _value, parameterName, parameterUnit) {
  return FutureBuilder<String>(
      future: _value,
      builder: (context, snapshot) {
        return Text("$parameterName: ${snapshot.data} $parameterUnit",
            style: biggerFont);
      });
}
