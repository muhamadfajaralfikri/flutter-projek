import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:na/News_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'forgot_passwordpage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _Loginform();
}

class _Loginform extends State<LoginForm> {
  TextEditingController controller = TextEditingController();
  TextEditingController password = TextEditingController();
  bool checkValue = false;

  void saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('nama', controller.text);
    preferences.setString('pass', password.text);
  }

  Future<bool> getbol() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool('value') ?? false;
  }

  Future<String> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('nama') ?? '';
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
              const SizedBox(
                height: 80,
              ),
              const Text(
                'HALAMAN LOGIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 400,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Manga',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Manga ...',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 25,
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
                          labelText: 'password',
                          suffixIcon: Icon(
                            FontAwesomeIcons.eye,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
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
                                    return const ForgotPasswordpage();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'lupa password ?',
                              style: TextStyle(color: Colors.orange[900]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
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
                                password.text == '123') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return NewsListPage();
                                  },
                                ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
