import 'package:flutter/widgets.dart';

class Margin extends StatelessWidget {
  final double top;
  final double right;
  final double bottom;
  final double left;
  final double all;
  final Widget child;

  Margin({
    this.top,
    this.right,
    this.bottom,
    this.left,
    this.all,
    @required this.child
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        all ?? left,
        all ?? top,
        all ?? right,
        all ?? bottom
      ),
      child: child,
    );
  }
}