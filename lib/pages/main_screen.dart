import 'package:flutter/material.dart';
import 'package:neo_docs_task/data/classes.dart';
import 'package:neo_docs_task/pages/widgets/bar_labeling.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.values});

  final List<BarObject> values;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BarLabeling(
              values: values,
            ),
            Center(
                child: Container(
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
      ),
    );
  }
}
