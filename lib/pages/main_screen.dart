import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neo_docs_task/controller/bar_pointer_controller.dart';
import 'package:neo_docs_task/data/classes.dart';
import 'package:neo_docs_task/pages/widgets/bar_labeling.dart';
import 'package:neo_docs_task/pages/widgets/bar_pointer.dart';
import 'package:neo_docs_task/pages/widgets/user_input.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.values});

  final List<BarObject> values;

  @override
  Widget build(BuildContext context) {
    Get.put(BarPointerCont());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    BarLabeling(
                      values: values,
                    ),
                    Center(
                        child: Container(
                      height: 15,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Row(children: [
                        ...values.map((value) => Expanded(
                              flex: value.value,
                              child: Container(
                                height: 15,
                                color: value.color,
                              ),
                            ))
                      ]),
                    )),
                    BarLabeling(
                      values: values,
                      isTopLabel: false,
                    ),
                  ],
                ),
                BarPointer(
                  max: values.last.range,
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            UserInput(
              max: values.last.range,
            ),
          ],
        ),
      ),
    );
  }
}
