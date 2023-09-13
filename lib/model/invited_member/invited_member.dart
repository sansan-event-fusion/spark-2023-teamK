import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invited_member.freezed.dart';
part 'invited_member.g.dart';

@freezed
class InvitedMember with _$InvitedMember {
  factory InvitedMember({
    required String invitedMemberId,
    required String name,
    required String icon,
    required DateTime createdAt,
  }) = _InvitedMember;

  factory InvitedMember.empty() => InvitedMember(
        invitedMemberId: '',
        name: '',
        icon: '',
        createdAt: DateTime.now(),
      );

  factory InvitedMember.fromJson(Map<String, dynamic> json) => _$InvitedMemberFromJson(json);

  factory InvitedMember.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return InvitedMember.fromJson(data).copyWith(invitedMemberId: doc.id);
  }
}

extension InvitedMemberX on InvitedMember {
  Map<String, dynamic> toDocument() => toJson()..remove('invitedMemberId');
}
