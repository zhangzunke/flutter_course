import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  Widget _buildContent(Map? parameters) {
    return parameters == null
        ? Container()
        : ListTile(
            title: Text('Received Id: ${parameters["id"]}'),
            subtitle: Text("Get.back(result: {'success': true})"),
            onTap: () {
              Get.back(result: {'success': true});
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    final parameters = Get.parameters;
    final arguments = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Detail Page')),
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
          _buildContent(arguments),
        ],
      ),
    );
  }
}
