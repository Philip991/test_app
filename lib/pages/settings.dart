//import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/pages/login_page.dart';
//import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../widget/icon_widget.dart';
//import 'package:flutter_settings_screens/flutter_settings_screens.dart';
//import 'package:test_app/widget/icon_widget.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    await _auth.signOut();
  }

  TextStyle headingStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blue);

  TextStyle headingStyleIos = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: CupertinoColors.inactiveGray);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "General",
                    style: headingStyle,
                  ),
                ],
              ),
              const ListTile(
                leading: Icon(Icons.language),
                title: Text("Change Password"),
                subtitle: Text("Choose new Password"),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.cloud),
                title: Text("Update Email"),
                subtitle: Text("Prefer a different email?"),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.mail),
                title: Text("Update Username"),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  //signOutUser();
                  // Color(Colors.grey);
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("Assessment App"),
                            content: const Text(
                                'Are you sure you want to log  out?'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel')),
                              TextButton(
                                  onPressed: () {
                                    logout();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Text('Continue')),
                              // cancelButton,
                              // continueButton,
                            ],
                          ));
                },
                child: ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: Text("Sign Out"),

                  //onTap: signOutUser(),
                ),
              )
              // const ListTile(
              //   leading: Icon(Icons.exit_to_app), title: Text("Sign Out"),
              //   //onTap: signOutUser(),
              // ),
            ],
          ),
        ),
      ),
      // body: SafeArea(
      //   child: ListView(
      //     padding: const EdgeInsets.all(24),
      //     children: [
      //       SettingsGroup(
      //         title: 'General',
      //         children: <Widget>[
      //           buildChangePassword(),
      //           buildUpdateEmail(),
      //           buildUpdateUsername(),
      //           buildLogout(),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}

void signOutUser() {}

// Widget cancelButton = TextButton(
//     onPressed: () {
//       Navigator.of(context).pop();

//     },
//     child: Text('Cancel'));

// Widget continueButton = TextButton(onPressed: () {
//   logout()
// }, child: Text('Continue'));

// Widget buildLogout() => SimpleSettingsTile(
//       title: 'Logout',
//       subtitle: '',
//       leading: IconWidget(
//         icon: Icons.logout,
//         color: Colors.blueAccent,
//       ),
//       //  onTap: () => ,
//     );

// Widget buildUpdateUsername() => SimpleSettingsTile(
//       title: 'Update Username',
//       subtitle: '',
//       leading: IconWidget(
//         icon: Icons.aod_outlined,
//         color: Colors.blueAccent,
//       ),
//     );

// Widget buildUpdateEmail() => SimpleSettingsTile(
//       title: 'Update Email',
//       subtitle: '',
//     );

// Widget buildChangePassword() => SimpleSettingsTile(
//       title: 'Change Password',
//       subtitle: '',
//     );
