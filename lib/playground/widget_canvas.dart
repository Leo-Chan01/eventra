import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/shared/widgets/eventra_date_picker_textfield.dart';
import 'package:eventra/shared/widgets/eventra_email_textfield.dart';
import 'package:eventra/shared/widgets/eventra_phone_textfield.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Widget Canvas',
          style: 14.w400.copyWith(color: colorScheme.onSurface),
        ),
      ),
      body: Center(
        child: EventraDatePickerTextfield(),
      ),
    );
  }
}
