import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_management/model/user_model.dart';
import 'package:state_management/stream_builder/controller/stream_builder_api_home_controller.dart';
import 'package:state_management/stream_builder/ui/widget/item_button_widget.dart';

class StreamBuilderAPIHome extends StatefulWidget {
  const StreamBuilderAPIHome({Key? key}) : super(key: key);

  @override
  State<StreamBuilderAPIHome> createState() => _StreamBuilderAPIHomeState();
}

class _StreamBuilderAPIHomeState extends State<StreamBuilderAPIHome> {
  final _streamController = StreamController<UserModel>.broadcast();
  final StreamBuilderController _streamBuilderController = StreamBuilderController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    _streamBuilderController.getUser().then((user) {
      if (user != null) {
        _streamController.add(user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamBuilder Counter Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder(
            stream: _streamController.stream,
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
        ),
      ),
      floatingActionButton: ItemButtonWidget(
        onPressEvent: () {
          getData();
        },
        icon: Icons.refresh,
      ),
    );
  }
}
