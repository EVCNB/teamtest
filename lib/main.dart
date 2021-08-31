// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import 'package:flutter_sms/flutter_sms.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'dart:async';
import 'dart:convert';

import 'package:twilio_flutter/src/models/sms.dart';
import 'package:twilio_flutter/src/models/sent_sms_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controllerMessage;
  String _message = "no message", body = "";
  String _canSendSMSMessage = 'Check is not run.';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _controllerMessage = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Activation Prototype'),
        ),
        body: ListView(children: <Widget>[
          ListTile(
            leading: const Icon(Icons.message),
            title: //TextField(
                CupertinoTextField(
                    //decoration: const InputDecoration(labelText: 'Add Message'),
                    controller: _controllerMessage,
                    textInputAction: TextInputAction.done,
                    onChanged: (String value) => setState(() {}),
                    minLines: 3,
                    maxLines: 5),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Theme.of(context).accentColor),
                padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(vertical: 16)),
              ),
              onPressed: () {
                print("Button Pressed $_controllerMessage");
              },
              child: Text(
                'SEND',
                style: Theme.of(context).accentTextTheme.button,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
