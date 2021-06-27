import 'package:client_app/Screens/Navbar.dart';
import 'package:client_app/Screens/Register.dart';
import 'package:flutter/material.dart';
import 'package:client_app/Screens/models.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'login';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            appTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String phoneNumber;
  String pass;
  bool obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  labelText: 'phone number',
                  hintText: 'Enter phone number',
                  icon: Icon(Icons.phone)),
              onSaved: (value) {
                phoneNumber = value;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              obscureText: obscurePass,
              decoration: InputDecoration(
                labelText: 'password',
                hintText: 'Enter password',
                suffixIcon: IconButton(
                  icon: Icon(
                      obscurePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      obscurePass = !obscurePass;
                    });
                  },
                ),
                icon: Icon(Icons.lock),
              ),
              onSaved: (value) {
                pass = value;
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                const Spacer(),
                OutlineButton(
                  onPressed: _submit,
                  child: const Text('login'),
                ),
                const Spacer()
              ],
            ),
            Row(
              children: <Widget>[
                const Spacer(),
                Text("have not registered yet?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: Text("Register")),
                Spacer()
              ],
            ),
          ],
        ),
      ),
    ));
  }

  void _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Form submitted');
      controller.request(phoneNumber + pass);
      // if (false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Navbar()),
      );
      //}
    }
  }
}
