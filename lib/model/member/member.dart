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
    DateTime? updatedAt,
  }) = _Member;

  factory Member.empty() => Member(
        name: '',
        icon: '',
        createdAt: DateTime.now(),
        description: '',
        memberId: '',
        role: '',
        updatedAt: null,
      );

  factory Member.mock() => Member(
        name: 'mockName',
        icon: 'https://picsum.photos/200/300',
        createdAt: DateTime.now(),
        description: 'mockDescription',
        memberId: 'mockAccountId',
        role: 'mockRole',
        updatedAt: DateTime.now(),
      );

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);

  factory Member.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Member.fromJson(data).copyWith(memberId: doc.id);
  }
}