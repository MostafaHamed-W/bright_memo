import 'package:flutter/material.dart';
import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  final bool isEditingPage;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isEditingPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        const Spacer(),
        isEditingPage
            ? CustomIcon(
                icon: Icons.close,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : Container(),
        const SizedBox(width: 7),
        CustomIcon(
          icon: icon,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
