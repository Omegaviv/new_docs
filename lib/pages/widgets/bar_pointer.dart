import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neo_docs_task/controller/bar_pointer_controller.dart';

class BarPointer extends StatelessWidget {
  const BarPointer({
    super.key,
    required this.max
  });

  final int max;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BarPointerCont>();
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Obx(
        () => Row(
          children: [
            Expanded(
                flex: controller.getValue -
                    (controller.getValue <= 40 ? 4 : 2),
                child: Container()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 45,
                ),
                Text(
                  '${controller.getValue}',
                  softWrap: true,
                  style: const TextStyle(
                      height: -1.5, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Expanded(
                flex: (max - controller.getValue) -
                    (controller.getValue <= 40 ? 2 : 2),
                child: Container()),
          ],
        ),
      ),
    );
  }
}
