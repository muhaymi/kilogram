import 'package:flutter/material.dart';
import 'package:kilogram/list_post_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  bool showError = false;

  void _login(BuildContext context) {
    final phoneNumber = _phoneNumberController.text;
    if (phoneNumber.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ListPostPage()),
      );
    } else {
      setState(() {
        showError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    prefixIcon: const Icon(Icons.phone),
                    errorText:
                        showError ? 'Nomor Telepon tidak boleh kosong' : null,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showError = false;
                    });
                    _login(context);
                  },
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
