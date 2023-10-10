import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:login_tests/repository/user_repository.dart';
import 'package:login_tests/utils/resource.dart';
import 'package:login_tests/view/default_widgets/default_password_text_input.dart';
import 'package:login_tests/view/default_widgets/default_text_field.dart';
import 'package:login_tests/web_client/request/UserLoginRequest.dart';

import '../../res/dimens.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  Widget? loginButtonLabelWidget = const Text('Entrar');
  final Logger log = Get.find<Logger>();

  final UserRepository repository = Get.find<UserRepository>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    const bizuImage =
        'https://bizucash.com.br/wp-content/uploads/2023/01/Logotipo-Horizontal_Color-132-bisucash-andrevinhosa.png';
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(default_padding),
                child: Container(
                  padding: const EdgeInsets.all(default_padding),
                  decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.11),
                            blurRadius: default_radius,
                            spreadRadius: 0.0)
                      ],
                      borderRadius: BorderRadius.circular(default_radius)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        bizuImage,
                        width: 300,
                        height: 100,
                      ),
                      const SizedBox(
                        height: default_margin,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(default_padding),
                        child: DefaultTextField(
                          onChanged: (String? text) {
                            if (text != null) {
                              setState(() {
                                email = text;
                              });
                            }
                          },
                          label: const Text('Insira seu Email'),
                          prefixIcon: const Icon(Icons.email_rounded),
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(default_padding),
                          child: DefaultPasswordTextField(
                            onChanged: (String text) {
                              setState(() {
                                password = text;
                              });
                            },
                          )),
                      const SizedBox(
                        height: default_margin,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(default_padding),
                            child: FilledButton(
                                onPressed: () {
                                  var request = UserLoginRequest(
                                      email: email, password: password);
                                  var response = repository.loginUser(request);
                                  response.then((value) => {
                                        if (value is Success)
                                          {
                                            log.i((value as Success).data),
                                            Get.snackbar('Sucesso',
                                                'Bem vindo ${request.email}'),
                                            Get.toNamed('/test')
                                          }
                                        else
                                          {
                                            log.e((value as Error).error),
                                            Get.snackbar(
                                                'Erro', (value as Error).error)
                                          }
                                      });
                                },
                                child: loginButtonLabelWidget),
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
