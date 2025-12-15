import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LangPage extends StatelessWidget {
  const LangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title'.tr)),
      body: Center(
        child: Column(
          children: [
            Text('name'.trParams({'name': 'Mike'})),
            ListTile(
              title: Text('中文'),
              onTap: () {
                final locale = Locale('zh', 'Hans');
                Get.updateLocale(locale);
              },
            ),
            ListTile(
              title: Text('English'),
              onTap: () {
                final locale = Locale('en', 'US');
                Get.updateLocale(locale);
              },
            ),
          ],
        ),
      ),
    );
  }
}
