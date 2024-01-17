import 'package:flutter/material.dart';

import 'app_bar_profile.dart';
import 'app_bar_profile_update.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 180.0,
        automaticallyImplyLeading: false,
        flexibleSpace: const MyProfileAppBarUpdate(),
      ),

    );
  }
}
