import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_pms/features/staff/data/models/staff_model.dart';

abstract class StaffFirebaseService {
  Future<Either> getStaff();
  Future<Either> addTask(String? name, String? type, String? task);
  Future<Either> changeStaffInfo();
}

class StaffFirebaseServiceImpl extends StaffFirebaseService {
  @override
  Future<Either> addTask(String? name, String? type, String? task) async {
    try {
      var mainCollection = await FirebaseFirestore.instance
          .collection('Staff')
          .doc('$name $type')
          .update({'task': task});
      return const Right('SUccess!');
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> changeStaffInfo() {
    // TODO: implement changeStaffInfo
    throw UnimplementedError();
  }

  @override
  Future<Either> getStaff() async {
    try {
      var mainCollection =
          await FirebaseFirestore.instance.collection('Staff').get();
      List<StaffModel> models = [];
      for (var element in mainCollection.docs) {
        models.add(StaffModel.fromMap(element.data()));
      }

      return Right(models);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
