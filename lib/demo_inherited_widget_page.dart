import 'package:flutter/material.dart';

class DemoInheritedWidgetPage extends StatefulWidget {
  const DemoInheritedWidgetPage({super.key});

  @override
  State<DemoInheritedWidgetPage> createState() => _DemoInheritedWidgetPageState();
}

class _DemoInheritedWidgetPageState extends State<DemoInheritedWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo inherited widget"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              ParentWidget(),
              ChildWidget()
            ],
          ),
        ),
      ),
    );
  }
}


class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Parent widget"),
    );
  }
}


class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Child widget"),
    );
  }
}
