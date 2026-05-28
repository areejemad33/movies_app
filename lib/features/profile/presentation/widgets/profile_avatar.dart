import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/assets_manager.dart';

class ProfileAvatar extends StatelessWidget {
  final String avatarId;
  final VoidCallback onTap;

  const ProfileAvatar({
    super.key,
    required this.avatarId,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        AssetsManager.avatars[int.parse(avatarId)],
        width: 150.h,
        height: 150.h,
        fit: BoxFit.contain,
      ),
    );
  }
}