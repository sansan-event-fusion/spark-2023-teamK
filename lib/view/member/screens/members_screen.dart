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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text("参加リクエスト"),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    requestedMemberList == null ? 0 : requestedMemberList!.length,
                itemBuilder: (context, index) {
                  return MemberListItem(
                    memberImageUrl: requestedMemberList![index].values.first,
                    memberName: requestedMemberList![index].keys.first,
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text("招待中"),
              ),              
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    invitedMemberList == null ? 0 : invitedMemberList!.length,
                itemBuilder: (context, index) {
                  return MemberListItem(
                    memberImageUrl: invitedMemberList![index].values.first,
                    memberName: invitedMemberList![index].keys.first,
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text("参加中"),
              ),              
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: memberList.length,
                itemBuilder: (context, index) {
                  return MemberListItem(
                    memberImageUrl: memberList[index].values.first,
                    memberName: memberList[index].keys.first,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
