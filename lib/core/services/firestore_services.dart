import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_dreams/core/services/data_service.dart';

class FirestoreServices implements DatabaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  //هنا عمللت دي عشان اقدر اضيف داتا بشكل عام للداتا بيز بتاعتنا
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  //هنا عمللت دي عشان اقدر اخد داتا بشكل عام للداتا بيز المتخزنه
  // record معين
  Future<List<Map<String, dynamic>>> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return [data.data() as Map<String, dynamic>];
    }
    Query<Map<String, dynamic>> data = firestore.collection(path);
    if (query != null) {
      if (query['keyword'] != null) {
        data = data.where('keywords', arrayContains: query['keyword']);
      }
      if (query['orderBy'] != null) {
        data = data.orderBy(
          query['orderBy'],
          descending: query['descending'] ?? false,
        );
      }
      if (query['limit'] != null) {
        data = data.limit(query['limit']);
      }
    }
    var result = await data.get();
    return result.docs.map((e) => e.data()).toList();
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    required String documentId,
  }) async {
    await firestore.collection(path).doc(documentId).update(data);
  }

  @override
  Future<void> removeKeyword({
    required String path,
    required String documentId,
    required String keyword,
  }) async {
    await firestore.collection(path).doc(documentId).update({
      "searchKeywords": FieldValue.arrayRemove([keyword]),
    });
  }

  @override
  Future<void> clearKeywords({
    required String path,
    required String documentId,
  }) async {
    await firestore.collection(path).doc(documentId).update({
      "searchKeywords": [],
    });
  }
}
