import 'package:calculator/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'widgets/buttons.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();

    return GetBuilder<Controller>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              height: MediaQuery.of(context).size.height * 0.29,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(
                    () => Text(
                      _.userQuestion.value,
                      style: TextStyle(color: Colors.grey, fontSize: 28),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => Text(
                      _.userAnswer.value,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.71,
              width: double.infinity,
              child: GetBuilder<Controller>(
                builder: (_) => GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.15,
                  ),
                  itemBuilder: (__, int index) {
                    //CLEAR BUTTON
                    if (index == 0) {
                      return Buttons(
                        buttonTapped: () {
                          _.userQuestion.value = "";
                        },
                        color: Colors.green,
                        buttonText: _.buttonsName[index],
                        textColor: Colors.white,
                        buttonFontSize: 20,
                      );

                      //DELETE BUTTON
                    } else if (index == 1) {
                      return Buttons(
                        color: Colors.red,
                        buttonText: _.buttonsName[index],
                        textColor: Colors.white,
                        buttonFontSize: 20,
                      );

                      //REST OF THE BUTTONS
                    } else {
                      return Buttons(
                        buttonTapped: () {
                          _.userQuestion.value += _.buttonsName[index];
                        },
                        color: _.isOperator(_.buttonsName[index])
                            ? Colors.deepPurple
                            : Colors.deepPurple[50],
                        buttonText: _.buttonsName[index],
                        textColor: _.isOperator(_.buttonsName[index])
                            ? Colors.white
                            : Colors.deepPurple,
                        buttonFontSize: 20,
                      );
                    }
                  },
                  itemCount: _.buttonsName.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
