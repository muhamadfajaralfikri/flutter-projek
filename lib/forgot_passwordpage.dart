import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:na/login_form.dart';
import 'package:cool_alert/cool_alert.dart';

class ForgotPasswordpage extends StatefulWidget {
  const ForgotPasswordpage({super.key});

  @override
  State<ForgotPasswordpage> createState() => _ForgotPasswordpage();
}

class _ForgotPasswordpage extends State<ForgotPasswordpage> {
  TextEditingController controller = TextEditingController();
  TextEditingController password = TextEditingController();
  void saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('nama', controller.text);
    preferences.setString('pass', password.text);
  }

  Future<String> getMane() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('pass') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 53, 195, 176),
                Color.fromARGB(255, 235, 235, 235),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'password lama',
                    suffixIcon: Icon(
                      FontAwesomeIcons.key,
                      size: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          labelText: 'user name',
                          suffixIcon: Icon(
                            FontAwesomeIcons.envelope,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextField(
                        controller: password,
                        decoration: const InputDecoration(
                          labelText: 'password ',
                          suffixIcon: Icon(
                            FontAwesomeIcons.eye,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const LoginForm();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'sudah ada password ?',
                              style: TextStyle(color: Colors.orange[900]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Colors.blueGrey,
                                  Colors.indigo,
                                  Colors.teal,
                                ])),
                        child: MaterialButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: const StadiumBorder(),
                          child: const Text(
                            'Masuk',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () async {
                            if (controller.text == 'admin' &&
                                password.text == '1234') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginForm();
                                  },
                                ),
                              );
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.info,
                                text: 'anda silahkan login kembali',
                                autoCloseDuration: const Duration(seconds: 2),
                              );
                              saveData();
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: SizedBox(
                                      height: 100,
                                      child: Column(
                                        children: [
                                          const Text(
                                              'Username atau Password salah..'),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          OutlinedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('ok'))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
