// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'must_parameters/must_parameters_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Winemaker',
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Winemaker'),
        ),
        body: MustParametersForm(),
      ),
    );
  }
}
