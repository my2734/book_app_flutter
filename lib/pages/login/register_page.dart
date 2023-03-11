import 'package:book_app2/pages/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Image.asset('assets/images/register2.png',height: 150),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: Text(
                  'Welcome MyBook',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff333333),
                  ),
                ),
              ),
              Text(
                'Signup with MyBook in simle steps',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff606470),
                ),
              ),
            
              Padding(
                padding: EdgeInsets.fromLTRB(0, 60, 0, 10),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Container(
                      width: 50,
                      child: Image.asset('assets/images/ic_mail.png'),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffDeD0D2),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Container(
                      width: 50,
                      child: Image.asset('assets/images/ic_lock.png'),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffDeD0D2),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              //   child: TextField(
              //     controller: _phoneController,
              //     style: TextStyle(fontSize: 18, color: Colors.black),
              //     decoration: InputDecoration(
              //       labelText: 'Phone',
              //       prefixIcon: Container(
              //         width: 50,
              //         child: Image.asset('assets/images/ic_phone.png'),
              //       ),
              //       border: OutlineInputBorder(
              //         borderSide: BorderSide(
              //           color: Color(0xffDeD0D2),
              //         ),
              //         borderRadius: BorderRadius.all(Radius.circular(6)),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: SizedBox(
                  width: 100,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () async {
                      // print("hello canh ayye");
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: 'ngocmy@gmail.com',
                          password: '12345678',
                        );
                        print('add user success');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a User? ',
                      style: TextStyle(
                        color: Color(0xff606470),
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          color: Color(0xff3277D8),
                          fontSize: 16,
                        ),
                      ),
                    )
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
