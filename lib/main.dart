import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_tests/application/application_bindings.dart';
import 'package:login_tests/view/login/login_page.dart';
import 'package:login_tests/view/test/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter tests',
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF207A00)),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const LoginPage(),
          children: [
            GetPage(name: '/test', page: () => const TestPage()),
          ],
        )
      ],
    );
  }
}
