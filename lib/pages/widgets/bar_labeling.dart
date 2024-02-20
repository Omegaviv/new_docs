import 'package:flutter/material.dart';
import 'package:neo_docs_task/data/classes.dart';

class BarLabeling extends StatelessWidget {
  const BarLabeling({super.key, required this.values, this.isTopLabel = true});

  final List<BarObject> values;
  final bool isTopLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: [
        if (isTopLabel)
          const Text(
            '0',
            textAlign: TextAlign.end,
          ),
        ...values
            .asMap()
            .entries
            .map(
              (value) => Expanded(
                flex: value.value.value,
                child: Text(
                  (isTopLabel ? value.key.isOdd : value.key.isEven)
                      ? ''
                      : '${value.value.range}',
                  textAlign: TextAlign.end,
                ),
              ),
            )
            .toList(),
      ],
    ));
  }
}
