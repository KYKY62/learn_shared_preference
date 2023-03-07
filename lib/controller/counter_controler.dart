import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void increment() async {
    counter + 1;
    saveCountToStorage();
  }

  void decrement() async {
    counter - 1;
    if (counter <= 0) {
      counter = 0.obs;
    }
    saveCountToStorage();
  }

  Future<void> saveCountToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("counter", counter.value);
  }

  Future<void> getCountToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    int countValue = prefs.getInt('counter') ?? 0;
    counter.value = countValue;
  }

  @override
  void onInit() {
    super.onInit();
    getCountToStorage();
  }
}
