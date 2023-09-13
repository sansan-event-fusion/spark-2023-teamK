import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pending_member.freezed.dart';
part 'pending_member.g.dart';

@freezed
class PendingMember with _$PendingMember {
  factory PendingMember({
    required String pendingMemberId,
    required String name,
    required String icon,
    required DateTime createdAt,
  }) = _PendingMember;

  factory PendingMember.empty() => PendingMember(
        pendingMemberId: '',
        name: '',
        icon: '',
        createdAt: DateTime.now(),
      );

  factory PendingMember.fromJson(Map<String, dynamic> json) => _$PendingMemberFromJson(json);

  factory PendingMember.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return PendingMember.fromJson(data).copyWith(pendingMemberId: doc.id);
  }
}

extension PendingMemberX on PendingMember {
  Map<String, dynamic> toDocument() => toJson()..remove('pendingMemberId');
}