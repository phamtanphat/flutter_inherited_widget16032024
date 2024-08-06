import 'package:flutter/material.dart';

class DemoContextPage extends StatefulWidget {
  int number = 20;

  @override
  State<DemoContextPage> createState() => _DemoContextPageState();
}

class _DemoContextPageState extends State<DemoContextPage> {
  String label = "Demo context Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo context page"),
      ),
      body: Container(
        child: Center(
          child: ParentWidget(
            child: ChildWidget(),
          ),
        ),
      ),
    );
  }
}


class ParentWidget extends StatefulWidget {
  Widget child;

  ParentWidget({required this.child});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  @override
  Widget build(BuildContext context) {
    DemoContextPage? demoWidget = context.findAncestorWidgetOfExactType();
    return Container(
      child: Column(
        children: [
          Text("Parent widget get data: ${demoWidget?.number}"),
          widget.child
        ],
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    _DemoContextPageState? demoState = context.findAncestorStateOfType();
    return Container(
      child: Text("Child widget ${demoState?.label}"),
    );
  }
}


