import 'package:flutter/material.dart';

class VisibilityWidget extends StatefulWidget {
  final Widget child;
  final bool isVisible;
  final VoidCallback onTap;

  const VisibilityWidget({
    Key? key,
    required this.child,
    required this.isVisible,
    required this.onTap,
  }) : super(key: key);

  @override
  _VisibilityWidgetState createState() => _VisibilityWidgetState();
}

class _VisibilityWidgetState extends State<VisibilityWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Visibility(
        visible: widget.isVisible,
        child: widget.child,
      ),
    );
  }
}