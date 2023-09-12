import 'package:emo_project/controller/member/member_controller.dart';
import 'package:emo_project/controller/invited_member/invited_member_controller.dart';
import 'package:emo_project/controller/pending_member/pending_member_controller.dart';
import 'package:emo_project/view/member/components/member_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MembersScreen extends ConsumerWidget {
  const MembersScreen(
      {super.key});
  const MembersScreen({
    super.key
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberState = ref.watch(memberControllerProvider(groupId: "test"));
    final invitedMemberState = ref.watch(invitedMemberControllerProvider(groupId: "test"));
    final pendingMemberState = ref.watch(pendingMemberControllerProvider(groupId: "test"));
    
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
            pendingMemberState.when(
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
            invitedMemberState.when(
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
              child: Text("参加中"),
            ),
            memberState.when(
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
            )
          ],
        ),
      ),
    );
  }
}
