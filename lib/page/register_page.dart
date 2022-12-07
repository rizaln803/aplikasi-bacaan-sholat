import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
 
class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  String passwordc = "";
  bool showSpinner = false;
 
  @override
  Widget build(BuildContext context) {
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
                  'Sign Up',
                  style: TextStyle(fontSize: 20),
                )),
             Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value){
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
                onChanged: (value){
                  password = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kata Sandi',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                obscureText: true,
                onChanged: (value){
                  passwordc = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Konfirmasi Kata Sandi',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  child: const Text('Daftar'),
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try{
                      if(email != "" && password != "" && passwordc != ""){
                        if(password == passwordc){
                          final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          if(newUser != null){
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, 'home_screen');
                          }
                        }else{
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Error!"),
                              content: const Text("Konfirmasi kata sandi salah"),
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
                    }catch(e){
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
                const Text('Sudah punya akun?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context,
                      'login_screen');
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )),);
  }
}