import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Masuk extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  TextEditingController password = TextEditingController();
  void saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('nama', controller.text);
    preferences.setString('pass', password.text);
  }

  Future<String> getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('nama') ?? '';
  }

  Future<String> getMane() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('pass') ?? '';
  }

  Masuk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blueGrey,
                Colors.indigo,
                Colors.teal,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
