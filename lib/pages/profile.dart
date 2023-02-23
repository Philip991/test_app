import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

///import 'package:test_app/model/user.dart';
import 'package:test_app/utils/user_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final User? user = FirebaseAuth.instance.currentUser;
  // final DatabaseReference userRef =
  //     // ignore: deprecated_member_use
  //     FirebaseDatabase.instance.reference().child('Users').child(user!.uid);

  //final ref = FirebaseDatabase.instance.ref('Users');

  //var coverHeight;
  final double coverHeight = 280;
  final double profileHeight = 144;
  //final user = UserPreferences.myUser;
  //final user = User(email: email, phoneNumber: phoneNumber, interest1: interest1)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.black,
        child: Image.asset(
          'assets/images/cover-foto.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage('assets/images/profile-picture.jpg'),
      );

  Widget buildContent() => Column(
        children: [
          // userRef.child('username').once().then((DataSnapshot snapshot) {
          //   String username = snapshot.value;
          // })
          const SizedBox(height: 8),
          Text(
            'Philip Omayuku',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Software Developer',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
          // const SizedBox(height: 16),
          // Divider(),
          // const SizedBox(height: 16),
          // buildAbout(),
          // const SizedBox(height: 32)
        ],
      );
}
