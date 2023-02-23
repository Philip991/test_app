//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:test_app/model/user.dart';
import 'package:test_app/pages/login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('Users');
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController interest1Controller = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController interest2Controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 22.0,
      letterSpacing: 1,
      fontWeight: FontWeight.bold,
    );

    final inputDecoration = InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 2,
            )));

    return Scaffold(
      body: Padding(
        key: _formKey,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Assessment App',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const Text('Name', style: textStyle),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter a Username';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const Text('Name', style: textStyle),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter your Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Email';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const Text('Name', style: textStyle),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your Phone Number';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const Text('Name', style: textStyle),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: interest1Controller,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText:
                          "Specify a sport interest. eg; football, ice hockey",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field cannot be empty';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const Text('Name', style: textStyle),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: interest2Controller,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: "You'll need at least 2 sport interests",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Field cannot be empty';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const Text('Name', style: textStyle),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (password) {
                      if (password!.isEmpty) {
                        return 'Enter Password';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(''),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text(
                  'Register',
                ),
                onPressed: () {
                  const CircularProgressIndicator();
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                  }
                  createAccount();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void createAccount() {
    try {
      firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((result) {
        databaseReference.child(result.user!.uid).set({
          'username': usernameController.text,
          'email': emailController.text,
          'phoneNumber': phoneNumberController.text,
          'interest1': interest1Controller.text,
          'interest2': interest2Controller.text
        }).then((res) {
          isLoading = false;
          Fluttertoast.showToast(
              msg: 'Account Created Successfully',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              textColor: Colors.white);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
            msg: 'The password provided is too weak.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white);
        //print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white);
        //print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // Future registerUser({required String username}) async {
  //   final docUser = FirebaseFirestore.instance.collection('users').doc();

  //   final user = User(
  //     id: docUser.id,
  //     email: emailController.text,
  //     phoneNumber: phoneNumberController.text,
  //     interest1: interest1Controller.text,
  //   );

  //   final json = user.toJson();

  //   await docUser.set(json);
  // }
}
