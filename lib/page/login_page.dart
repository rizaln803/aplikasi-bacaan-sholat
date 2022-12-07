import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
 
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}
 
class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    String email = "";
    String password = "";
    bool showSpinner = false;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Aplikasi Bacaan Sholat Online',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                    email = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                onChanged: (value) {
                    password = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kata Sandi',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  child: const Text('Masuk'),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      if(email != "" && password != ""){
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, 'home_screen');
                        }
                      }else{
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Error!"),
                            content: const Text("Form tidak boleh kosong"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Container(
                                color: Colors.black,
                                  padding: const EdgeInsets.all(14),
                                  child: const Text("OK"),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('Belum punya akun?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context,
                      'regis_screen');
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )),);
  }
}