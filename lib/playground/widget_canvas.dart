import 'package:flutter/material.dart';

class WidgetCanvas extends StatefulWidget {
  const WidgetCanvas({super.key});

  static const String path = '/widget-canvas';
  static const String name = 'WidgetCanvas';

  @override
  State<WidgetCanvas> createState() => _WidgetCanvasState();
}

class _WidgetCanvasState extends State<WidgetCanvas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Widget Canvas'),
      ),
    );
  }
}
