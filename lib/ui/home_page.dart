import 'package:flutter/material.dart';
import 'package:state_management/change_notifier/ui/change_notifier_home.dart';
import 'package:state_management/future_builder/ui/future_builder_api_home.dart';
import 'package:state_management/future_builder/ui/future_builder_home.dart';
import 'package:state_management/stream_builder/ui/stream_builder_api_home.dart';
import 'package:state_management/stream_builder/ui/stream_builder_combined.dart';
import 'package:state_management/stream_builder/ui/stream_builder_home.dart';
import 'package:state_management/widget/app_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppButton(
              title: 'ChangeNotifier Demo',
              onPressEvent: () {
                changePage(
                  context,
                  const ChangeNotifierHome(
                    key: Key('ChangeNotifierHomePageKey'),
                  ),
                );
              },
            ),
            AppButton(
              title: 'FutureBuilder Counter Demo',
              onPressEvent: () {
                changePage(
                  context,
                  const FutureBuilderHome(
                    key: Key('FutureBuilderHomePageKey'),
                  ),
                );
              },
            ),
            AppButton(
              title: 'FutureBuilder API Demo',
              onPressEvent: () {
                changePage(
                  context,
                  const FutureBuilderAPIHome(
                    key: Key('FutureBuilderAPIHomePageKey'),
                  ),
                );
              },
            ),
            AppButton(
              title: 'StreamBuilder Counter Demo',
              onPressEvent: () {
                changePage(
                  context,
                  const StreamBuilderHome(
                    key: Key('StreamBuilderHomePageKey'),
                  ),
                );
              },
            ),
            AppButton(
              title: 'StreamBuilder API Demo',
              onPressEvent: () {
                changePage(
                  context,
                  const StreamBuilderAPIHome(
                    key: Key('StreamBuilderAPIHomePageKey'),
                  ),
                );
              },
            ),
            AppButton(
              title: 'StreamBuilder Combined Demo',
              onPressEvent: () {
                changePage(
                  context,
                  const StreamBuilderCombined(
                    key: Key('StreamBuilderCombinedHomePageKey'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void changePage(
    BuildContext context,
    Widget page,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return page;
        },
      ),
    );
  }
}
