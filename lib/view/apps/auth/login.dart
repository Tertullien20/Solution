import '../../../utils/validators/email.dart';
import '../../widgets/text.dart';
import '../../widgets/snack_bar.dart';
import '../profile/my_dash_board.dart';
import 'package:flutter/material.dart';
import '../../widgets/remember_me.dart';
import '../../../services/auth_service.dart';
import '../../../utils/validators/empty.dart';
import 'package:solution/view/widgets/space.dart';
import 'package:solution/view/widgets/input.dart';
import '../../../utils/validators/min_length.dart';
import 'package:solution/view/widgets/button.dart';
import 'package:solution/view/apps/auth/signin.dart';
import 'package:solution/utils/constants/colors.dart';
import 'package:solution/view/apps/auth/forget_pass.dart';
import '../../../provider/language/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthenticationService _auth= AuthenticationService();
  final mailController = TextEditingController();
  final passController = TextEditingController();
  bool rememberMe = false, _obscurePass = true;
  String responseValue = '';
  bool _loading = false;

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
                  text("Back", color: white)
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
                      boldText(AppLocalizations(context).translate("welcome_back"),
                          color: white, size: 30.0, align: TextAlign.start),
                    ],
                  ),
                  space(h: 20.0),
                  buildInput("Enter your lightning address",mailController, TextInputType.emailAddress, prefixIcon: Image.asset(
                    "imgs/vector.png",
                    width: 30.0,
                    height: 30.0,
                    color: yellow,
                  ), maxLines: 1),
                  buildInput("Password",passController, TextInputType.visiblePassword, suffixIcon: IconButton(onPressed: ()=> setState(() {
                    _obscurePass = !_obscurePass;
                  }), icon: Icon(_obscurePass ? Icons.visibility_off: Icons.visibility, color: grey92)), obscureText: _obscurePass, prefixIcon:  Padding(
                    padding:  const EdgeInsets.all(8.0),
                    child: Icon(Icons.lock_outline, color: passController.text.isNotEmpty ? white: grey92),
                  ), validators: [empty, minLength]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        rememberMeCheckbox(
                          rememberMe,
                              (newValue) {
                            setState(() {
                              rememberMe = newValue!;
                            });
                          },
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const  ForgetPass()));
                          },
                          child: Row(
                            children: [
                              boldText('Forget password?', color: white, size: 16.0),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    child: button("SIGN IN", bgColor: primary, loading: _loading, colorLoader: white, onTap: () async{

                      if(mailController.text.isNotEmpty && passController.text.isNotEmpty){
                        String? emailValidationResult = validMail(mailController.text);

                        if (emailValidationResult != null) {
                          setState(() {
                            responseValue = emailValidationResult;
                          });
                        } else {
                          setState(() {
                            _loading = true;
                            responseValue = '';
                          });
                          dynamic result = await _auth.signInWithEmailAndPassword(mailController.text, passController.text);
                          responseValue = result.toString();
                          print(result);

                          if(result=="Instance of 'UserApp'"){
                            setState(() {
                              _loading=false;
                              responseValue = "";
                            });
                          }else if(responseValue=="null"){
                            responseValue="Erreur de connexion";
                          }
                          signin();
                          setState(() {
                            _loading = false;
                          });
                          /*Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  const MyDashBoard()));*/
                        }
                      }else {
                        setState(() {
                          responseValue = 'Tous les champs sont requis. ';
                        });
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: text(responseValue, color: red, align: TextAlign.start, overflow: TextOverflow.visible),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 10.0, bottom: 40.0),
            child: InkWell(
              focusColor: transparent,
              highlightColor: transparent,
              hoverColor: transparent,
              splashColor: transparent,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SigninView()));
              },
                child: text( AppLocalizations(context).translate("have_account"), color: white)),
          )
        ],
      ),
    );
  }

  Widget buildInput(String text, controller, keyboardType, {suffixIcon, bool obscureText = false, prefixIcon, validators, maxLines}) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: input(controller,
          maxLines: maxLines,
          obscureText: obscureText ,
          keyboardType: keyboardType ,
          colorBorder: primary, colorFont: fillGrey,
          decoration: textFieldDecoration(text, prefixIcon: prefixIcon , filled: false, suffixIcon: suffixIcon), validators: validators),
    );
  }

  signin(){
    setState(() {
        if(responseValue=="Instance of 'UserApp'"){
          responseValue = '';
          ScaffoldMessenger.of(context).showSnackBar(showSnackBar("Connexion réussie"));
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const MyDashBoard();
          }));
        }
    });
  }
}