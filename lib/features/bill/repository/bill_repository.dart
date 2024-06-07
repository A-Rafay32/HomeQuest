import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:real_estate_app/core/utils/types.dart';
import 'package:real_estate_app/features/bill/model/bill.dart';

class BillRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference billCollection = FirebaseFirestore.instance.collection("bills");

  FutureEither0 createBill(Bill bill) async {
    try {
      DocumentReference docRef = await billCollection.add(bill.toMap());
      await docRef.update({'id': docRef.id});
      return success("Bill created successfully");
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  FutureEither0 updateBill(Bill bill) async {
    try {
      await billCollection.doc(bill.id).update(bill.toMap());
      return success("Bill updated successfully");
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  FutureEither0 deleteBill(String id) async {
    try {
      await billCollection.doc(id).delete();
      return success("Bill deleted successfully");
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  FutureEither1<Bill> getBillById(String id) async {
    try {
      DocumentSnapshot doc = await billCollection.doc(id).get();
      if (doc.exists) {
        return Right(Bill.fromMap(doc.data() as Map<String, dynamic>));
      } else {
        return failure("Bill not found");
      }
    } on FirebaseException catch (e) {
      return failure(e.message.toString());
    }
  }

  Stream<List<Bill>> getAllBills() {
    try {
      return billCollection.snapshots().map((querySnapshot) {
        return querySnapshot.docs.map((docSnapshot) {
          return Bill.fromMap(docSnapshot.data() as Map<String, dynamic>);
        }).toList();
      });
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<Bill>> getBillsByHouseId(String houseId) {
    try {
      return billCollection.where('houseId', isEqualTo: houseId).snapshots().map((querySnapshot) {
        return querySnapshot.docs.map((docSnapshot) {
          return Bill.fromMap(docSnapshot.data() as Map<String, dynamic>);
        }).toList();
      });
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      rethrow;
    }
  }
}
