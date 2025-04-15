import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/errors/firebase_exp.dart';
import 'package:ecommerce_app/core/network/services/data_base_service.dart';

class FireStoreService implements DataBaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    try {
      if (docId != null) {
        await _firestore.collection(path).doc(docId).set(data);
      } else {
        await _firestore.collection(path).add(data);
      }
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? uId,
    Map<String, dynamic>? query,
  }) async {
    try {
      if (uId != null) {
        var data = await _firestore.collection(path).doc(uId).get();
        return data.data();
      } else {
        Query<Map<String, dynamic>> data = _firestore.collection(path);

        if (query != null) {
          if (query['orderBy'] != null) {
            var orderByField = query['orderBy'];
            var descending = query['descending'] ?? false;
            data = data.orderBy(orderByField, descending: descending);
          }
          if (query['limit'] != null) {
            data = data.limit(query['limit']);
          }
          if (query['where'] != null) {
            final whereClause = query['where'] as Map<String, dynamic>;
            data = data.where(
              whereClause['field'],
              isEqualTo: whereClause['value'],
            );
          }
        }

        var result = await data.get();
        return result.docs.map((e) => e.data()).toList();
      }
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  @override
  Future<bool> isDataExist({
    required String path,
    required String uId,
  }) async {
    try {
      var data = await _firestore.collection(path).doc(uId).get();
      return data.exists;
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  // Additional useful methods
  Future<void> updateData({
    required String path,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(path).doc(docId).update(data);
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  Future<void> deleteData({
    required String path,
    required String docId,
  }) async {
    try {
      await _firestore.collection(path).doc(docId).delete();
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  Stream<List<Map<String, dynamic>>> streamCollection({
    required String path,
    Map<String, dynamic>? query,
  }) {
    try {
      Query<Map<String, dynamic>> collection = _firestore.collection(path);

      if (query != null) {
        if (query['orderBy'] != null) {
          collection = collection.orderBy(
            query['orderBy'],
            descending: query['descending'] ?? false,
          );
        }
        if (query['limit'] != null) {
          collection = collection.limit(query['limit']);
        }
      }

      return collection
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }
}
