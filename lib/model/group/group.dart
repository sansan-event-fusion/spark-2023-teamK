import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  factory Group({
    required String groupId,
    required String name,
    required String description,
    required String icon,
    required int memberCount,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Group;

  factory Group.empty() => Group(
        groupId: '',
        name: '',
        description: '',
        icon: '',
        memberCount: 0,
        createdAt: DateTime.now(),
        updatedAt: null,
      );

  factory Group.mock() => Group(
        groupId: 'groupMockId',
        name: 'mockName',
        description: 'mockDescription',
        icon: 'https://picsum.photos/200/300',
        memberCount: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  factory Group.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Group.fromJson(data).copyWith(groupId: doc.id);
  }
}
