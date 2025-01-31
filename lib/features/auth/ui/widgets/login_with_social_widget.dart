import 'package:flutter/material.dart';

class LoginWithSocialWidget extends StatelessWidget {
  final String assetPath;
  final Function()? onTap;
  const LoginWithSocialWidget({
    super.key, required this.assetPath, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(assetPath),
      onTap: onTap,
    );
  }
}
