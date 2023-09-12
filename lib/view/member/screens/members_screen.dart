import 'package:emo_project/controller/pending_member/pending_member_controller.dart';
import 'package:emo_project/view/member/components/member_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MembersScreen extends ConsumerWidget {
  const MembersScreen(
      {super.key, required this.memberList, this.invitedMemberList});

  final List<Map<String, String>>? invitedMemberList;
  final List<Map<String, String>> memberList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pendingMemberControllerProvider(groupId: "test"));
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
            state.when(
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              data: (data) {
                return Column(
                  children: [
                    for (int i = 0; i < data.length; i++) ...{
                      MemberListItem(
                        memberImageUrl: data[i].icon,
                        memberName: data[i].name,
                      )
                    }
                  ],
                );
              },
            ),
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
