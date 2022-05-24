import 'package:flutter/material.dart';
import 'package:state_management/change_notifier/ui/widget/item_button_widget.dart';
import 'package:state_management/future_builder/controller/future_builder_home_controller.dart';

class FutureBuilderHome extends StatefulWidget {
  const FutureBuilderHome({Key? key}) : super(key: key);

  @override
  State<FutureBuilderHome> createState() => _FutureBuilderHomeState();
}

class _FutureBuilderHomeState extends State<FutureBuilderHome> {
  late Future<int> counter;
  final controller = FutureBuilderController();

  @override
  void initState() {
    counter = controller.getVal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder Counter Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
              ),
              FutureBuilder(
                  future: counter,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text(
                        '0',
                        style: Theme.of(context).textTheme.displayMedium,
                      );
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        int value = snapshot.data as int;
                        return Text(
                          // Get the [counter] value from the
                          // controller.
                          '$value',
                          style: Theme.of(context).textTheme.displayMedium,
                        );
                      } else {
                        return const Text(
                          'Some error thrown!',
                        );
                      }
                    } else {
                      return const Text(
                        'Something went wrong!',
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: Wrap(
        children: [
          ItemButtonWidget(
            key: const Key('incrementIconFB'),
            icon: Icons.add,
            onPressEvent: () {
              counter = controller.increment();
              setState(() {});
            },
          ),
          const SizedBox(
            width: 10,
          ),
          ItemButtonWidget(
            key: const Key('decrementIconFB'),
            icon: Icons.remove,
            onPressEvent: () {},
          ),
        ],
      ),
    );
  }
}
