import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoInheritedWidgetPage extends StatefulWidget {
  const DemoInheritedWidgetPage({super.key});

  @override
  State<DemoInheritedWidgetPage> createState() => _DemoInheritedWidgetPageState();
}

class _DemoInheritedWidgetPageState extends State<DemoInheritedWidgetPage> {
  String text = "Hello";
  int number = 0;

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
              Text("Demo widget $number"),
              ElevatedButton(onPressed: () {
                setState(() {
                  number += 1;
                });
              }, child: Text("Increase number")),
              MyInheritedWidget(
                value: text,
                child: Column(
                  children: [
                    ParentWidget(),
                    ChildWidget()
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  String value;
  Widget child;

  MyInheritedWidget({
    required this.value,
    required this.child
  }): super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
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
    print("Parent widget build");
    return Container(
      child: Text("Parent widget"),
    );
  }
}


class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("Child widget build");
    return Container(
      child: Text("Child widget"),
    );
  }
}
