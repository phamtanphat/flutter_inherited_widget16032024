import 'package:flutter/material.dart';

class DemoContextPage extends StatefulWidget {
  const DemoContextPage({super.key});

  @override
  State<DemoContextPage> createState() => _DemoContextPageState();
}

class _DemoContextPageState extends State<DemoContextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo context page"),
      ),
      body: Container(),
    );
  }
}
