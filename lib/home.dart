import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_shared_preference/controller/counter_controler.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final counterC = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
          actions: const [],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("Angka ${counterC.counter}")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => counterC.increment(),
                  child: const SizedBox(
                    width: 100,
                    height: 50,
                    child: Icon(Icons.add),
                  ),
                ),
                InkWell(
                  onTap: () => counterC.decrement(),
                  child: const SizedBox(
                    width: 100,
                    height: 50,
                    child: Icon(Icons.remove),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
