import 'package:flutter/cupertino.dart';
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
      body: DemoInheritedWidget(
        child: const Column(
          children: [
            ParentWidget(),
            ChildWidget()
          ],
        ),
      )
    );
  }
}

class DemoInheritedWidget extends StatefulWidget {
  Widget child;

  DemoInheritedWidget({required this.child});

  @override
  State<DemoInheritedWidget> createState() => _DemoInheritedWidgetState();
}

class _DemoInheritedWidgetState extends State<DemoInheritedWidget> {
  String text = "Hello";
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
            children: [
              Text("Demo widget $number"),
              ElevatedButton(onPressed: () {
                setState(() {
                  number += 1;
                });
              }, child: const Text("Increase number")),
              MyInheritedWidget(
                value: text,
                child: widget.child
              ),
            ],
          )
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

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
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
    MyInheritedWidget? myInheritedWidget = MyInheritedWidget.of(context);
    return Container(
      child: Column(
        children: [
          Text("Parent widget"),
          Text("Data from inherited widget ${myInheritedWidget?.value}")
        ],
      ),
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
