import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tagtly/tagtly.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tagtly Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TagtlyApp(),
    );
  }
}

class TagtlyApp extends StatefulWidget {
  const TagtlyApp({Key? key}) : super(key: key);

  @override
  State<TagtlyApp> createState() => _TagtlyAppState();
}

class _TagtlyAppState extends State<TagtlyApp> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tagtly Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TagtlyTextField(
              decoration: const InputDecoration(
                  hintText: 'Type anything',
                  contentPadding: EdgeInsets.symmetric(horizontal: 8)),
              onChanged: (String value) {
                text = value;
                setState(() {});
              },
            ),
          ),
          const Text(
            'Output:',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
          ),
          Expanded(
              child: TagtlyTextView(
            text,
            onClick: (TextObj value) => log(value.type.toString()),
          ))
        ],
      ),
    );
  }
}
