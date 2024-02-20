import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class BarPointerCont extends GetxController {
  final RxInt _value = 0.obs;

  TextEditingController textEditingController =
      TextEditingController(text: '0');

  final formFieldKey = GlobalKey<FormFieldState>();

  int get getValue => _value.value;

  void updatePointer(int data) {
    _value.value = data;
  }
}
