import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  final Widget child;

  const BasePage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState(child);
}

class _BasePageState extends State<BasePage> {
  final Widget innerWidget;

  _BasePageState(this.innerWidget);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: innerWidget,
    );
  }

  @override
  void initState() {
    super.initState();
    print("base_screen ${this.innerWidget} -> initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("base_screen ${this.innerWidget} -> didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant BasePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("base_screen ${this.innerWidget} -> didUpdateWidget");
  }

  @override
  void deactivate() {
    print("base_screen ${this.innerWidget} -> deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("base_screen ${this.innerWidget} -> dispose");
  }
}
