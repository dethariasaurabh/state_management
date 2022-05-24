import 'package:flutter/material.dart';

class ItemButtonWidget extends StatelessWidget {

  final IconData icon;
  final Function() onPressEvent;

  const ItemButtonWidget({
    required this.onPressEvent,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: onPressEvent,
      child: Icon(
        icon,
      ),
    );
  }
}
