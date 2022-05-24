import 'package:flutter/material.dart';
import 'package:state_management/change_notifier/ui/widget/item_button_widget.dart';
import 'package:state_management/future_builder/controller/future_builder_api_home_controller.dart';
import 'package:state_management/model/user_model.dart';

class FutureBuilderAPIHome extends StatefulWidget {
  const FutureBuilderAPIHome({Key? key}) : super(key: key);

  @override
  State<FutureBuilderAPIHome> createState() => _FutureBuilderAPIHomeState();
}

class _FutureBuilderAPIHomeState extends State<FutureBuilderAPIHome> {
  late Future<UserModel?> user;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    user = FutureBuilderController().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder API Demo'),
      ),
      body: SafeArea(
        child: FutureBuilder<UserModel?>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  UserModel? userModel = snapshot.data as UserModel?;
                  return Center(
                    child: ListTile(
                      title: Text(userModel?.bankName ?? ''),
                      subtitle: Text(userModel?.accountNumber ?? ''),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No data found!'),
                  );
                }
              } else {
                return const Center(
                  child: Text('No data found!'),
                );
              }
            } else {
              return const Center(
                child: Text('Something wrong!'),
              );
            }
          },
        ),
      ),
      floatingActionButton: ItemButtonWidget(
        icon: Icons.refresh,
        onPressEvent: () {
          getUser();
          // To update the FeatureBuilder...
          setState(() {});
        },
      ),
    );
  }
}
