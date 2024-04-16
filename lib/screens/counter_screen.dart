import 'package:counter_app/controllers/counter_controllers.dart';
import 'package:counter_app/screens/counter_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counter_Screen extends StatelessWidget {
  Counter_Screen({super.key});

  final countcontroller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "${countcontroller.count}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                    child: IconButton(
                        onPressed: () {
                          countcontroller.decrement();
                        },
                        icon: Icon(Icons.remove))),
                CircleAvatar(
                    child: IconButton(
                        onPressed: () {
                          countcontroller.increment();
                        },
                        icon: Icon(Icons.add))),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  countcontroller.count.value = 0;
                },
                child: Text("Reset")),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(() =>
                      Counter_Result(result: countcontroller.count.value));
                },
                child: const Text("Show Result"))
          ],
        ),
      ),
    );
  }
}
