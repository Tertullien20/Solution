import 'package:flutter/material.dart';
import '../../widgets/text.dart';


class MyProfileAppBar extends StatelessWidget {
  const MyProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      expandedTitleScale: 2.0,
      centerTitle: true,
      background: Image.asset(
        'imgs/back_rect.png',
        fit: BoxFit.cover,
        height: 100,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 20.0, bottom: 20.0),
            child: Container(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_circle_left_outlined)),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 60.0, left: 20.0, bottom: 15.0),
                    child: text("Mon compte", size: 28.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
