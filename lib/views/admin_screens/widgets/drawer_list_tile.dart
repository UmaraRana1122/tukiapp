import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class CustomListTile extends StatelessWidget {
  final IconData? icon;
  final String? iconAsset;
  final String title;
  final void Function()? onTap;

  const CustomListTile({
    Key? key,
    this.icon,
    this.iconAsset,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: AppColors.buttonColor, offset: Offset(1, 0)),
          ],
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: icon != null
            ? Icon(
                icon,
                color: AppColors.buttonColor,
              )
            : CircleAvatar(
                backgroundImage: AssetImage(iconAsset!),
                backgroundColor: Colors.transparent,
              ),
      ),
      title: Text(title),
      onTap: onTap,
    );
  }
}
