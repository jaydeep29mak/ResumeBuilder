import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/ResumeProvider.dart';
import 'pages/starting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ResumeProvider(),
      child: MaterialApp(
        title: 'Resume App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: starting_page(),
      ),
    );
  }
}
