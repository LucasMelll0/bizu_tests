import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_tests/repository/user_repository.dart';

import '../../model/company.dart';
import '../../utils/resource.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  UserRepository repository = Get.find<UserRepository>();

  var companyName = 'carregando';

  @override
  void initState() {
    super.initState();
    fetchCompany();
  }

  Future<void> fetchCompany() async {
    var response = await repository.findUserCompany();
    if (response is Success) {
      setState(() {
        companyName = ((response as Success).data as Company).name;
      });
    } else {
      print((response as Error).error);
      Get.toNamed('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(companyName),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
