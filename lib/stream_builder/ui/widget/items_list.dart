import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_management/stream_builder/ui/widget/item_button_widget.dart';


/// Best practice is to divide the UI into
/// the separate widgets. To follow the same
/// all the FABs are put in the separate widget.
/// As well all the FAB follows the same UI,
/// so created a common separate widget for it.

/// To call the functions from the parent
/// widget, the callback [getData] is used.

class ItemsList extends StatelessWidget {

  final StreamController counterStreamController;
  int counter;
  final Function() getData; // Callback to call the function

  ItemsList({
    required this.counterStreamController,
    this.counter = 0,
    required this.getData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ItemButtonWidget(
          onPressEvent: () {
            counter++;
            counterStreamController.add(counter);
          },
          icon: Icons.add,
        ),
        const SizedBox(
          width: 10,
        ),
        ItemButtonWidget(
          onPressEvent: () {
            if (counter > 0) {
              counter--;
              counterStreamController.add(counter);
            }
          },
          icon: Icons.remove,
        ),
        const SizedBox(
          width: 10,
        ),
        ItemButtonWidget(
          onPressEvent: () {
            getData.call();
          },
          icon: Icons.refresh,
        ),
      ],
    );
  }
}
