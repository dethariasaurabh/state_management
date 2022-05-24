import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_management/model/user_model.dart';
import 'package:state_management/stream_builder/controller/stream_builder_api_home_controller.dart';
import 'package:state_management/stream_builder/ui/widget/items_list.dart';

/// This is to demonstrate how to update values
/// of two different Widgets using the Stream builders.

class StreamBuilderCombined extends StatefulWidget {
  const StreamBuilderCombined({Key? key}) : super(key: key);

  @override
  State<StreamBuilderCombined> createState() => _StreamBuilderCombinedState();
}

class _StreamBuilderCombinedState extends State<StreamBuilderCombined> {
  final _counterStreamController = StreamController<int>.broadcast();
  final _userDataStreamController = StreamController<UserModel>.broadcast();
  final StreamBuilderController _streamBuilderController = StreamBuilderController();

  final int _counter = 0;

  getData() {
    _streamBuilderController.getUser().then((user) {
      if (user != null) {
        _userDataStreamController.add(user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'StreamBuilder Combined Demo',
        ),
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
                stream: _counterStreamController.stream,
                initialData: 0,
                builder: (context, stream) {
                  final state = stream.data;
                  return Text(
                    '$state',
                    style: Theme.of(context).textTheme.displayMedium,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: _userDataStreamController.stream,
                initialData: 0,
                builder: (context, stream) {
                  if (stream.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (stream.connectionState == ConnectionState.done ||
                      stream.connectionState == ConnectionState.active) {
                    if (stream.hasData) {
                      final state = stream.data as UserModel;
                      return ListTile(
                        title: Text(
                          '${state.bankName}',
                        ),
                        subtitle: Text(
                          '${state.accountNumber}',
                        ),
                      );
                    } else {
                      return const Text('Something went wrong!');
                    }
                  } else {
                    return const Text('Connection cannot be established.');
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ItemsList(
        counterStreamController: _counterStreamController,
        counter: _counter,
        getData: getData,
      ),
    );
  }
}
