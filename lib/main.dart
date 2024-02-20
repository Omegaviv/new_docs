import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:neo_docs_task/constants.dart';
import 'package:neo_docs_task/pages/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'NeoDocs Task',
      debugShowCheckedModeBanner: false,
      home: MainScreen(
        values: Constants.values,
      ),
    );
  }
}
