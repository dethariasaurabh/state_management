import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_management/stream_builder/ui/widget/item_button_widget.dart';

class StreamBuilderHome extends StatefulWidget {
  const StreamBuilderHome({Key? key}) : super(key: key);

  @override
  State<StreamBuilderHome> createState() => _StreamBuilderHomeState();
}

class _StreamBuilderHomeState extends State<StreamBuilderHome> {
  final _streamController = StreamController<int>.broadcast();
  var _counter = 0;

  @override
  void initState() {
    super.initState();
    _streamController.add(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamBuilder Counter Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder(
                stream: _streamController.stream,
                initialData: 0,
                builder: (context, stream) {
                  final state = stream.data;
                  return Text(
                    '$state',
                    style: Theme.of(context).textTheme.displayMedium,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Wrap(
        children: [
          ItemButtonWidget(
            onPressEvent: () {
              _counter++;
              _streamController.add(_counter);
            },
            icon: Icons.add,
          ),
          const SizedBox(
            width: 10,
          ),
          ItemButtonWidget(
            onPressEvent: () {
              if (_counter > 0) {
                _counter--;
                _streamController.add(_counter);
              }
            },
            icon: Icons.remove,
          ),
        ],
      ),
    );
  }
}
