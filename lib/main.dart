import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/calculator_view.dart';
import 'controller/controller.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}
