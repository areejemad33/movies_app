import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_manager.dart';

class AppLanguageSwitch extends StatefulWidget {
  const AppLanguageSwitch({super.key});

  @override
  State<AppLanguageSwitch> createState() =>
      _AppLanguageSwitchState();
}

class _AppLanguageSwitchState
    extends State<AppLanguageSwitch> {

  int selectedIndex = 0;

  final List<String> languages = [
    "assets/images/LR.png",
    "assets/images/EG.png",
  ];

  @override
  Widget build(BuildContext context) {

    return Container(

    

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(30.r),

        border: Border.all(
          color: ColorsManager.yellow,
          width: 2,
        ),
      ),

      child: Row(

        mainAxisSize: MainAxisSize.min,

      children: List.generate(

  languages.length,

  (index) {

    final bool isSelected =
        selectedIndex == index;

    return Row(

      mainAxisSize: MainAxisSize.min,

      children: [

        GestureDetector(

          onTap: () {

            setState(() {

              selectedIndex = index;

            });
          },

          child: AnimatedContainer(

            duration: const Duration(
              milliseconds: 250,
            ),


            decoration: BoxDecoration(

              shape: BoxShape.circle,

              border: Border.all(

                color: isSelected
                    ? ColorsManager.yellow
                    : Colors.transparent,

                width: 4,
              ),
            ),

            child: Image.asset(
              languages[index],
              width: 30.w,
            ),
          ),
        ),

        if (index != languages.length - 1)
          SizedBox(width: 12.w),
      ],
    );
  },
),
      ),
    );
  }
}