import 'package:flutter/material.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/widgets/input.dart';
import 'package:solution/view/widgets/space.dart';
import '../../../services/auth_service.dart';
import '../../widgets/snack_bar.dart';
import '../../widgets/text.dart';
import '../../../provider/language/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login.dart';

class InsertNickName extends StatefulWidget {
  final String emailAdress;
  final String password;
  const InsertNickName(
      {super.key, required this.emailAdress, required this.password});

  @override
  State<InsertNickName> createState() => _InsertNickNameState();
}

class _InsertNickNameState extends State<InsertNickName> {
  final AuthenticationService _auth = AuthenticationService();
  final nickNameController = TextEditingController();
  bool _loading = false;
  String responseValue = '';

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  const Icon(FontAwesomeIcons.arrowLeft, color: white),
                  space(w: 10.0),
                  text("Previous", color: white)
                ]),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      boldText(
                          AppLocalizations(context).translate("your_nickname"),
                          color: white,
                          size: 30.0,
                          align: TextAlign.start),
                    ],
                  ),
                  space(h: 10.0),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: text(
                            AppLocalizations(context).translate("see_name"),
                            color: white,
                            size: 16.0,
                            align: TextAlign.start),
                      ),
                    ],
                  ),
                  space(h: 20.0),
                  buildInput(AppLocalizations(context).translate("your_nickname"), nickNameController, TextInputType.text,
                      maxLines: 1,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              nickNameController.clear();
                            });
                          },
                          icon: const Icon(FontAwesomeIcons.xmark,
                              color: greySample))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: text(responseValue,
                        color: red,
                        align: TextAlign.start,
                        overflow: TextOverflow.visible),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
            child: button(AppLocalizations(context).translate("continue"), bgColor: primary, loading: _loading, colorLoader: white, onTap: () async {
              if (nickNameController.text.isNotEmpty) {
                setState(() {
                  responseValue = '';
                  _loading = true;
                });
                dynamic result = await _auth.registerWithEmailAndPassword(
                    nickNameController.text,
                    widget.emailAdress,
                    widget.password);
                responseValue = result.toString();

                if (result == null) {
                  setState(() {
                    _loading = false;
                    responseValue = "Erreur de connexion";
                  });
                }
                registerIn();
                setState(() {
                  _loading = false;
                });
              } else {
                responseValue = 'Renseignez votre pseudo';
              }
            }),
          )
        ],
      ),
    );
  }

  Widget buildInput(String text, controller, keyboardType,
      {suffixIcon,
      bool obscureText = false,
      prefixIcon,
      validators,
      maxLines}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: input(controller,
          maxLines: maxLines,
          obscureText: obscureText,
          keyboardType: keyboardType,
          colorBorder: primary,
          colorFont: fillGrey,
          decoration: textFieldDecoration(text,
              prefixIcon: prefixIcon, filled: false, suffixIcon: suffixIcon),
          validators: validators),
    );
  }

  void registerIn() {
    setState(() {
      if (responseValue == "Instance of 'UserApp'") {
        setState(() {
          responseValue = '';
        });
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginView()),
            (route) => false);
        ScaffoldMessenger.of(context)
            .showSnackBar(showSnackBar("Inscription réussie"));
      }
    });
  }
}
