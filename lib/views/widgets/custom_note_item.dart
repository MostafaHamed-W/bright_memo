import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kItemColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 15),
              child: Text(
                "Flutter Tips",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 16),
              child: Text(
                "Build your container here in the subtitle",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 20,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.trash,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 13),
            child: Text(
              "May21, 2022",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
