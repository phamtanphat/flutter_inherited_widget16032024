import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget16032024/demo_context_page.dart';
import 'package:flutter_inherited_widget16032024/demo_inherited_widget_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DemoInheritedWidgetPage()
    );
  }
}

