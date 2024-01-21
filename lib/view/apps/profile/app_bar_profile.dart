import 'package:flutter/material.dart';
import 'package:solution/view/apps/profile/update_profile.dart';
import '../../../provider/language/app_localizations.dart';
import '../../widgets/text.dart';

class MyProfileAppBar extends StatelessWidget {
  const MyProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FlexibleSpaceBar(
      centerTitle: true,
      background: Image.asset(
        'imgs/back_rect.png',
        fit: BoxFit.cover,
        height: 100,
      ),
      title: Stack(
        children: [
          Positioned(
            left: 30.0,
            top: 40.0,
            child: Container(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('imgs/left.png'),
                  ),
                  text(AppLocalizations(context).translate("back")),
                ],
              ),
            ),
          ),
          Positioned(
            right: 30.0,
            top: 40.0,
            child: Container(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdateProfile() ));
                    },
                    child: Image.asset('imgs/edit.png'),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 0,
            right: 0,
            //bottom: 80,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset('imgs/avatar.png',),
            ),
          ),
        ],
      ),
    );
  }
}
