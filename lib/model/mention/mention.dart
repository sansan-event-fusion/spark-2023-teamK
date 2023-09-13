import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mention.freezed.dart';
part 'mention.g.dart';

@freezed
class Mention with _$Mention {
  factory Mention({
    required String mentionId,
    required String memberId,
    required DateTime createdAt,
  }) = _Mention;

  factory Mention.empty() => Mention(
        mentionId: '',
        memberId: '',
        createdAt: DateTime.now(),
      );

  factory Mention.fromJson(Map<String, dynamic> json) => _$MentionFromJson(json);

  factory Mention.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Mention.fromJson(data).copyWith(mentionId: doc.id);
  }
}

extension MentionX on Mention {
  Map<String, dynamic> toDocument() => toJson()..remove('mentionId');
}
