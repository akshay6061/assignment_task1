import 'package:assignment_task1/view/dashBoard.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade400,
                        hintText: 'Enter Your Userame',
                        hintStyle: TextStyle(color: Colors.grey.shade800),
                        border: OutlineInputBorder()),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade400,
                        hintText: 'Enter Your Password',
                        hintStyle: TextStyle(color: Colors.grey.shade800),
                        border: OutlineInputBorder()),),
            ),
          Center(
            child: ElevatedButton(
              onPressed: () async {;
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard(),));
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
