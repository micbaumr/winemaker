import 'package:flutter/material.dart';
import 'package:winemaker/view/constants.dart';

FutureBuilder<String> getTextFutureBuilder(Future<String> _value, parameterName, parameterUnit) =>
    _value.toFutureBuilder((value) => Text("$parameterName: $value $parameterUnit", style: biggerFont));

extension ToFutureBuilder<T> on Future<T> {
  FutureBuilder<T> toFutureBuilder(Widget Function(T?) widgetMaker) => FutureBuilder<T>(
      future: this,
      builder: (context, snapshot) {
        return widgetMaker(snapshot.data);
      });
}
