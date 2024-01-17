import 'package:flutter/material.dart';

import 'app_bar_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 180.0,
        automaticallyImplyLeading: false,
        flexibleSpace: const MyProfileAppBar(),
      ),
    );
  }
}








