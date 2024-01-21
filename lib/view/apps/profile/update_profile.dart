import 'package:flutter/material.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/view/widgets/input.dart';
import 'package:provider/provider.dart';
import '../../../model/user_app.dart';
import '../../../provider/language/app_localizations.dart';
import '../../../services/db.dart';
import '../../widgets/loader.dart';
import '../../widgets/snack_bar.dart';
import '../../widgets/space.dart';
import '../../widgets/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  User? userT= FirebaseAuth.instance.currentUser;
  final nickNameController = TextEditingController();
  final emailController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<UserApp?>(context);
    double width= MediaQuery.of(context).size.width;

    return StreamBuilder<AppUserData>(
      stream: Database(user!.uid).user,
      builder:(context, snapshot){
        if(snapshot.hasData){
          AppUserData? userData= snapshot.data;
          nickNameController.text = userData!.name;
          emailController.text = userT!.email!;
          String idUser= userData.uid;
          String userUrlImg= userData.userUrlImg;

          return Scaffold(
            backgroundColor: secondary,
            body: Column(
              children: [
                Container(
                  color: secondary,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(children: [
                        const Icon(FontAwesomeIcons.arrowLeft, color: white),
                        space(w: 10.0),
                        text(AppLocalizations(context).translate("back"), color: white)
                      ]),
                    ),
                  ),
                ),
                Column(children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("imgs/avatar.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: button(AppLocalizations(context).translate("change_avatar"), bgColor: green, width:AppLocalizations(context).translate("change_avatar").length *10.0 ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(AppLocalizations(context).translate("your_nickname"), color: white),
                        space(h: 5.0),
                        buildInput(AppLocalizations(context).translate("your_nickname"), nickNameController, TextInputType.name),
                        space(h: 25.0),
                        text(AppLocalizations(context).translate("lightning_email"), color: white),
                        space(h: 5.0),
                        buildInput("Lightning Address", emailController, TextInputType.emailAddress),
                        space(h: 25.0),
                        button(AppLocalizations(context).translate("update_profile"), bgColor: primary, onTap: (){
                          setState(() {
                            loading = true;
                          });
                          String pseudo= nickNameController.text;
                          Database db= Database(idUser);
                          AppUserData userData= AppUserData(uid: idUser, name: pseudo, userUrlImg: userUrlImg);
                          db.updateCurrentUser(userData, idUser);
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              showSnackBar(AppLocalizations(context).translate("Profile successfully updated")));
                        },  loading: loading, colorLoader: white),
                      ],
                    ),
                  )
                ])
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

  Widget buildInput(String text, controller, keyboardType,
      {suffixIcon,
        maxLines}) {
    return input(controller,
        maxLines: maxLines,
        keyboardType: keyboardType,
        colorBorder: primary,
        colorFont: white,
        colorTxt: dark,
        decoration: textFieldDecoration(text, filled: false),
        );
  }
}
