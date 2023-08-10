import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7ea9b5),
      appBar: AppBar(
        backgroundColor: Color(0xff7ea9b5),
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 200,
                      width: 200,
                    ),
                    Text(
                      'Super Library',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                    Divider(
                      height: 40,
                      color: Colors.grey[300],
                      thickness: .7,
                      indent: 50,
                      endIndent: 50,
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter valid email';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'Please enter valid password';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  minWidth: 400,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Obtain shared preferences.
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('email', emailController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home_screen(
                            email: emailController.text,
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('success'),
                        ),
                      );
                    }
                  },
                  color: Color(0xffcccaa5),
                  child: const Text(
                    'login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 14),
                ),
                onPressed: () {},
                child: const Text('forget password ?'),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(3),
                      textStyle: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Create account',
                      style: TextStyle(
                        color: Color.fromARGB(255, 28, 109, 175),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
