import 'package:flutter/material.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/apps/first.dart';
import 'package:solution/view/widgets/loader.dart';
import 'package:solution/view/widgets/space.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../model/user_app.dart';
import '../../../provider/language/app_localizations.dart';
import '../../../services/auth_service.dart';
import '../../../services/db.dart';
import '../../widgets/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'app_bar_profile.dart';
import 'define_langue_in_app.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthenticationService _auth= AuthenticationService();

  User? userT= FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    final user= Provider.of<UserApp?>(context);

    return StreamBuilder<AppUserData>(
      stream: Database(user!.uid).user,
      builder:(context, snapshot){
        if(snapshot.hasData){
          AppUserData? userData= snapshot.data;

          return Scaffold(
            backgroundColor: secondary,
            appBar: AppBar(
              toolbarHeight: 160.0,
              automaticallyImplyLeading: false,
              flexibleSpace: const MyProfileAppBar(),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:30.0, left: 15.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(AppLocalizations(context).translate("my_nickname"), color: white),
                          boldText(userData!.name, color: white, size: 22.0)
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:30.0, left: 15.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(AppLocalizations(context).translate("lightning_email"), color: white),
                          Row(
                            children: [
                              Image.asset('imgs/vector.png'),
                              space(w: 5.0),
                              text("${userT!.email}", color: white),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          text("Language", color: white),
                        ],
                      ),
                      space(h: 10.0),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const DefineLanguageInApp()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(color: grey2C,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(FontAwesomeIcons.earthAfrica, color: white),
                                  space(w: 10.0),
                                  boldText("United Kingdom (British)", color: white)
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Image.asset(
                                    "imgs/flag/flag_english.png",
                                    width: 20.0,
                                    height: 20.0,
                                  ),
                                  space(w: 10.0),
                                  const Icon(
                                    Icons.keyboard_arrow_right,
                                    color: white,
                                    size: 25.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: (){
                    _auth.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const FirstView()),
                            (route) => false);            },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [text(AppLocalizations(context).translate("log_out"), color: white),space(w: 10.0),
                        Image.asset("imgs/logout.png", color: white)
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }else{
          return  Scaffold(
            body: Container(
              color: tertiary,
              child: Center(
                child: loader(color: white),
              ),
            ),
          );
        }
      },
    );
  }
}








