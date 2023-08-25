import 'package:flutter/widgets.dart';

class Margin extends StatelessWidget {
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final double? all;
  final double? horizontal;
  final double? vertical;
  final Widget child;

  Margin({
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.all,
    this.horizontal,
    this.vertical,
    required this.child
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        all ?? horizontal ?? left ?? 0,
        all ?? vertical ?? top ?? 0,
        all ?? horizontal ?? right ?? 0,
        all ?? vertical ?? bottom ?? 0
      ),
      child: child,
    );
  }
}