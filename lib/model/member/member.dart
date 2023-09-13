import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  factory Member({
    required String memberId,
    required String name,
    required String role,
    required String icon,
    required String description,
    required DateTime createdAt,
    required DateTime updatedAt
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  factory Member.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Member.fromJson(data).copyWith(memberId: doc.id);
  }
}

extension MemberX on Member {
  Map<String, dynamic> toDocument() => toJson()..remove('memberId');
}
