import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final Function onPressEvent;
  final String title;

  const AppButton({
    required this.title,
    required this.onPressEvent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressEvent(),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1!.apply(
          color: Colors.white,
        ),
      ),
    );
  }
}
