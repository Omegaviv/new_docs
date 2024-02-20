import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neo_docs_task/controller/bar_pointer_controller.dart';

class UserInput extends StatelessWidget {
  const UserInput({
    super.key,
    required this.max,
  });

  final int max;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BarPointerCont>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextFormField(
              controller: controller.textEditingController,
              key: controller.formFieldKey,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                int data = int.parse(value ?? '0');
                if (data < 0) return "Value shoulb be >=0";
                if (data > max) return "Value should be <=$max";
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter here',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                if (controller.formFieldKey.currentState!.validate()) {
                  controller.updatePointer(
                      int.parse(controller.textEditingController.text));
                }
              },
              icon: const Icon(
                Icons.arrow_circle_right_outlined,
                size: 40,
              ))
        ],
      ),
    );
  }
}
