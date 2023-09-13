import 'package:emo_project/view/member/screens/member_profile_screen.dart';
import 'package:flutter/material.dart';

class MemberListItem extends StatelessWidget {
  const MemberListItem(
      {super.key, required this.memberImageUrl, required this.memberName});

  final String memberImageUrl;
  final String memberName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MemberProfileScreen(
              memberImageUrl: memberImageUrl,
              memberName: memberName,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(memberImageUrl),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(memberName),
            )
          ],
        ),
      ),
    );
  }
}