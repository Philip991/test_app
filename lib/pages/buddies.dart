import 'package:flutter/material.dart';

class Buddies extends StatefulWidget {
  const Buddies({Key? key}) : super(key: key);

  @override
  _BuddiesState createState() => _BuddiesState();
}

class _BuddiesState extends State<Buddies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: const Text('Find your Buddies here'),
      ),
    );
  }
}
