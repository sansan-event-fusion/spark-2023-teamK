import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'like.freezed.dart';
part 'like.g.dart';

@freezed
class Like with _$Like {
  factory Like({
    required String likeId,
    required String memberId,
    required DateTime createdAt,
  }) = _Like;

  factory Like.empty() => Like(
        likeId: '',
        memberId: '',
        createdAt: DateTime.now(),
      );

  factory Like.fromJson(Map<String, dynamic> json) => _$LikeFromJson(json);

  factory Like.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Like.fromJson(data).copyWith(likeId: doc.id);
  }
}

extension LikeX on Like {
  Map<String, dynamic> toDocument() => toJson()..remove('likedId');
}
