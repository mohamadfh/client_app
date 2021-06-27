import 'package:client_app/Screens/Navbar.dart';
import 'package:flutter/material.dart';
import 'package:client_app/Screens/LoginPage.dart';
import 'package:client_app/Screens/models.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'create a new account';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            appTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: RegisterForm(),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool validated = false;
  String firstName;
  String lastName;
  String phoneNumber;
  String address;
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
              decoration: const InputDecoration(
                  labelText: 'first name',
                  hintText: 'Enter first name',
                  icon: Icon(Icons.person)),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'this field is required';
                }
                return null;
              },
              onSaved: (value) {
                firstName = value;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'last name',
                  hintText: 'Enter last name',
                  icon: Icon(Icons.person)),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'this field is required';
                }
                return null;
              },
              onSaved: (value) {
                lastName = value;
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  labelText: 'phone number',
                  hintText: 'Enter phone number',
                  icon: Icon(Icons.phone)),
              validator: (String value) {
                if (value.trim().length != 11) {
                  return 'Enter a valid phone number';
                }
                return null;
              },
              onSaved: (value) {
                phoneNumber = value;
              },
              onChanged: (value) {
                setState(() {
                  _formKey.currentState.validate();
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'address',
                  hintText: 'Enter address',
                  icon: Icon(Icons.map)),
              validator: (String value) {
                if (value.trim().isEmpty) {
                  return 'this field is required';
                }
                return null;
              },
              onSaved: (value) {
                address = value;
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
              validator: (String value) {
                Pattern p = r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$";
                RegExp regex = new RegExp(p);
                return (regex.hasMatch(value))
                    ? null
                    : 'Please enter valid password';
              },
              onSaved: (value) {
                pass = value;
              },
              onChanged: (value) {
                setState(() {
                  _formKey.currentState.validate();
                  //disable or enable submit
                });
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                const Spacer(),
                OutlineButton(
                  onPressed: _submit,
                  child: const Text('Register'),
                ),
                const Spacer()
              ],
            ),
            Row(
              children: <Widget>[
                const Spacer(),
                Text("Already have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text("login")),
                Spacer()
              ],
            ),
          ],
        ),
      ),
    ));
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Form submitted');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Navbar()),
      );
    }
  }
}
