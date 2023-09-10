import 'package:emo_project/view/member/components/member_list_item.dart';
import 'package:flutter/material.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen(
      {super.key,
      required this.memberList,
      this.requestedMemberList,
      this.invitedMemberList});

  final List<Map<String, String>>? requestedMemberList;
  final List<Map<String, String>>? invitedMemberList;
  final List<Map<String, String>> memberList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("メンバー一覧"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text("参加リクエスト"),
            ),
            for (int i = 0;
                requestedMemberList == null
                    ? i < 0
                    : i < requestedMemberList!.length;
                i++) ...{
              MemberListItem(
                memberImageUrl: requestedMemberList![i].values.first,
                memberName: requestedMemberList![i].keys.first,
              )
            },
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text("招待中"),
            ),
            for (int i = 0;
                invitedMemberList == null
                    ? i < 0
                    : i < invitedMemberList!.length;
                i++) ...{
              MemberListItem(
                memberImageUrl: invitedMemberList![i].values.first,
                memberName: invitedMemberList![i].keys.first,
              )
            },
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text("参加中"),
            ),
            for (int i = 0; i < memberList.length; i++) ...{
              MemberListItem(
                memberImageUrl: memberList[i].values.first,
                memberName: memberList[i].keys.first,
              )
            },
          ],
        ),
      ),
    );
  }
}
