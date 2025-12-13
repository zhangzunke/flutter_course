import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  Widget _buildContent(Map? parameters) {
    return parameters == null
        ? Container()
        : ListTile(
            title: Text('Received Value: '),
            subtitle: Text('Id $parameters["id"]'),
            onTap: () {},
          );
  }

  @override
  Widget build(BuildContext context) {
    final parameters = Get.parameters;
    return Scaffold(
      appBar: AppBar(title: Text('List Page')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Back'),
            subtitle: Text('Get.back()'),
            onTap: () {
              Get.back();
            },
          ),
          _buildContent(parameters),
        ],
      ),
    );
  }
}
