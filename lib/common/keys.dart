class Keys {
  // TODO: StoragePath を要件定義を基に設定する
  String getPostStoragePath(
          {required String groupId, required String postId}) =>
      "groups/$groupId/posts/$postId";
  String getMemberIconStoragePath() => "";
  String getUserIconStroragePath() => "";
  String getGroupIconStoragePath() => "";
}
