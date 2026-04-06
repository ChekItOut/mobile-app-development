import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>{
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();
    final _emailController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
                child: Form(
                    key: _formKey,
                    child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        children: <Widget>[
                        const SizedBox(height: 40.0),
                        TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                filled: true,
                                labelText: 'Username',
                            ),
                            autofocus: true,
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                    return 'Please enter a Username';
                                }

                                int alphabetCount = value.replaceAll(RegExp(r'[^a-zA-Z]'), '').length;
                                int digitCount = value.replaceAll(RegExp(r'[^0-9]'), '').length;

                                if (alphabetCount < 3 || digitCount < 3) {
                                    return 'Username is invalid';
                                }

                                return null;
                            },
                        ),
                        
                        const SizedBox(height: 12.0),
                        TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                filled: true,
                                labelText: 'Password',
                            ),
                            obscureText: true,
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                    return 'Please enter Password';
                                }
                                return null;
                            },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                            controller: _confirmPasswordController,
                            decoration: const InputDecoration(
                                filled: true,
                                labelText: 'Confirm Password',
                            ),
                            obscureText: true,
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                    return 'Please enter Confirm Password';
                                }
                                if (value != _passwordController.text) {
                                    return 'Confirm Password doesn\'t match Password';
                                }
                                return null;
                            },
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                                filled: true,
                                labelText: 'Email',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                    return 'Please enter Email Address';
                                }
                                return null;
                            },
                        ),
                        const SizedBox(height: 12.0),
                        OverflowBar(
                            alignment: MainAxisAlignment.end,
                            children: <Widget>[
                                
                                ElevatedButton(
                                    child: const Text('SIGN UP'),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                          
                                          Navigator.pushReplacementNamed(context, '/login');
                                      }
                                    },
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