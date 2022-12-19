import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: _emailController,
                  validator: (value) =>
                      value!.isEmpty ? 'please enter mail' : null),
              TextFormField(
                  controller: _passwordController,
                  validator: (value) =>
                      value!.isEmpty ? 'please enter passwors' : null),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                minWidth: double.infinity,
                color: Colors.blue,
                child: const Text(
                  'login',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Map creds = {
                    'email': _emailController,
                    'password': _passwordController,
                    'device_name': 'Flutter',
                  };
                  if (_formKey.currentState!.validate()) {
                    print(creds);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
