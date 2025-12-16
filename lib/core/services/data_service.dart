abstract class DatabaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  });
  // Future<dynamic> getData2({
  //   required String path,
  //   String? documentId,
  //   Map<String, dynamic>? query,
  // });
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  });
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    required String documentId,
  });
  Future<void> removeKeyword({
    required String path,
    required String documentId,
    required String keyword,
  });

  Future<void> clearKeywords({
    required String path,
    required String documentId,
  });
}
