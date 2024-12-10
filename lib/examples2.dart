import 'package:flutter/material.dart';

class TextButtonExample extends StatelessWidget {
  const TextButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RotatedBox Example'),
      ),
      // ListView để hiển thị danh sách các ListTile
      body: Center(
          child: TextButton(
              onPressed: () {
                print('Text button pressed');
              },
              child: Text('Click me'))),
    );
  }
}

class ElevatedButtonExample extends StatelessWidget {
  const ElevatedButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RotatedBox Example'),
      ),
      // ListView để hiển thị danh sách các ListTile
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                print('ElevatedButton pressed');
              },
              child: Text('Press me'))),
    );
  }
}

class OutlineButtonExample extends StatelessWidget {
  const OutlineButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OutlineButtonExample'),
      ),
      // ListView để hiển thị danh sách các ListTile
      body: Center(
          child: OutlinedButton(
              onPressed: () {
                print('OutlinedButton pressed');
              },
              child: Text('Tap me'))),
    );
  }
}

class GesturesExample extends StatelessWidget {
  const GesturesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GesturesExample'),
      ),
      // ListView để hiển thị danh sách các ListTile
      body: Center(
        child: GestureDetector(
            onTap: () {
              print('Container tapped');
            },
            onDoubleTap: () {
              print('Container double-tapped');
            },
            onLongPress: () {
              print('Container long-pressed');
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.black,
              child: Center(child: Text('Tap me')),
            )),
      ),
    );
  }
}

class TextFieldExample extends StatelessWidget {
  const TextFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFieldExample'),
      ),
      // ListView để hiển thị danh sách các ListTile
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter your name', border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Enter your email', border: OutlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
            )
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Xử lý đăng nhập ở đây
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng Nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập Email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập Password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                child: Text('Đăng nhập'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProgessIndicatorExample extends StatelessWidget {
  const ProgessIndicatorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ProgessIndicatorExample'),
        ),
        // ListView để hiển thị danh sách các ListTile
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(height: 20),
              LinearProgressIndicator(),
            ],
          ),
        )
    );
  }
}

class SnackBarExample extends StatelessWidget {
  const SnackBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SnackBarExample'),
        ),
        // ListView để hiển thị danh sách các ListTile
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('This is snack bar'),
                    action: SnackBarAction(label: 'Undo', onPressed: (){}),
                  )
              );
            },
            child: Text('Show Snack Bar'),
          ),
        )
    );
  }
}

class AlertDialogExample extends StatelessWidget {
  const AlertDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AlertDialogExample'),
        ),
        // ListView để hiển thị danh sách các ListTile
        body: Center(
          child: ElevatedButton(
              onPressed: (){
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text('Alert'),
                    content: Text('This is an alert dialog'),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Ok')
                      )
                    ],
                  );
                },
                );
              },
              child: Text('Show AlertDialog')
          ),
        )
    );
  }
}

class SimpleDialogExample extends StatelessWidget {
  const SimpleDialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('SimpleDialogExample'),
    ),
    // ListView để hiển thị danh sách các ListTile
    body: Center(
    child: ElevatedButton(
    onPressed: (){
    showDialog(
    context: context,
    builder: (context) {
    return SimpleDialog(
    title: Text('Alert'),
      children: <Widget> [
        SimpleDialogOption(
          onPressed: (){

          },
          child: Text('Option 1'),
        ),
        SimpleDialogOption(
          onPressed: (){

          },
          child: Text('Option 2'),
        )
      ],
    );
    },
    );
    },
        child: Text('Show SimpleDialog')
    ),
    )
    );
  }
}