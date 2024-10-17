import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  static const platform = MethodChannel('samples.flutter.dev/contacts');
  RxString contactsVar = 'No contacts fetched yet.'.obs;

  Future<void> getContacts() async {
    String contacts;
    try {
      final List<dynamic> result = await platform.invokeMethod('getContacts');
      contacts = result.join(", ");
    } on PlatformException catch (e) {
      contacts = "Failed to get contacts: '${e.message}'.";
    }
    contactsVar.value = contacts;
  }
}
