import 'package:flutter/material.dart';
import 'package:state_management/change_notifier/controller/change_notifier_home_controller.dart';
import 'package:state_management/change_notifier/ui/widget/item_button_widget.dart';

class ChangeNotifierHome extends StatefulWidget {
  const ChangeNotifierHome({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierHome> createState() => _ChangeNotifierHomeState();
}

class _ChangeNotifierHomeState extends State<ChangeNotifierHome> {
  // Object of the controller to access it.
  ChangeNotifierHomeController controller = ChangeNotifierHomeController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                // Get the [counter] value from the
                // controller.
                '${controller.counter}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Wrap(
        children: [
          ItemButtonWidget(
            key: const Key('incrementIconCN'),
            icon: Icons.add,
            onPressEvent: () {
              controller.increment();
            },
          ),
          const SizedBox(
            width: 10,
          ),
          ItemButtonWidget(
            key: const Key('decrementIconCN'),
            icon: Icons.remove,
            onPressEvent: () {
              controller.decrement();
            },
          ),
        ],
      ),
    );
  }
}
