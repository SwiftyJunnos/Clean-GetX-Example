import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'counter_controller.dart';
import 'counter_view.dart';

class CounterPage extends GetView<CounterController> {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: const SafeArea(child: CounterView()));
  }
}
