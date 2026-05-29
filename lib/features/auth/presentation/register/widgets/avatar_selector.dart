import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:movies_app/core/resources/assets_manager.dart';

class AvatarSelector extends StatefulWidget {
  const AvatarSelector({super.key, required this.onAvatarSelected});
  final Function(String avatar) onAvatarSelected;

  @override
  State<AvatarSelector> createState() =>
      _AvatarSelectorState();
}

class _AvatarSelectorState
    extends State<AvatarSelector> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(

      itemCount: AssetsManager.avatars.length,

      itemBuilder: (_, index, __) {

        final bool isSelected =
            selectedIndex == index;

        return AnimatedContainer(

          duration: const Duration(
            milliseconds: 300,
          ),

          width: isSelected ? 158 : 94,
          height: isSelected ? 161 : 94,

          padding: const EdgeInsets.all(4),

          decoration: BoxDecoration(

            shape: BoxShape.circle,

        
          ),

          child: ClipOval(
            child: Image.asset(
              AssetsManager.avatars[index],
            fit: BoxFit.cover,
            ),
          ),
        );
      },

      options: CarouselOptions(

        height: 161,

        enlargeCenterPage: true,
        enlargeFactor: 0.4,
        viewportFraction: .40,

        enableInfiniteScroll: true,

        onPageChanged: (index, reason) {

          setState(() {

            selectedIndex = index;
          widget.onAvatarSelected(index.toString());

          });
        },
      ),
    );
  }
}