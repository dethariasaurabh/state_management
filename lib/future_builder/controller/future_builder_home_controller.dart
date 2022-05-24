import 'dart:async';

class FutureBuilderController {

  int _counter = 0;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
  }

  Future<int> increment() async {
    _counter++;
    var count = await getVal();
    return count;
  }

  Future<int> getVal() async {
    await Timer(const Duration(seconds: 1), () {},);
    return _counter;
  }
}