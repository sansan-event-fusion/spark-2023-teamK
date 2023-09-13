class Keys {
  String getPostStoragePath(
          {required String groupId, required String postId}) =>
      "groups/$groupId/posts/$postId";
  String getMemberIconStoragePath() => "";
}
