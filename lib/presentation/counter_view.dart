import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounterController());

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                stepperButton(
                  icon: CupertinoIcons.minus,
                  onPressed: controller.decrement,
                ),
                const SizedBox(width: 20),
                Obx(
                  () => Text(
                    '${controller.count.value}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                stepperButton(
                  icon: CupertinoIcons.add,
                  onPressed: controller.increment,
                ),
              ],
            ),
          ),
          const Text(
            'Counter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget stepperButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return CupertinoButton(
      padding: const EdgeInsets.all(12),
      borderRadius: BorderRadius.circular(8),
      color: CupertinoColors.systemGrey5,
      onPressed: onPressed,
      child: Icon(icon, color: CupertinoColors.systemBlue),
    );
  }
}
