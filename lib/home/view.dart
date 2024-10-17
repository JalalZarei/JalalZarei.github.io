import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_contacts/home/controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => _body();

  Widget _body() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _text(),
            _button(),
          ],
        ),
      );

  Widget _text() => Obx(
        () => Text(controller.contactsVar.value),
      );

  Widget _button() => ElevatedButton(
        onPressed: controller.getContacts,
        child: const Text('Fetch Contacts'),
      );
}
