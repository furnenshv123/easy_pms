import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_pms/features/electronic_keys/data/models/electronic_key_model.dart';

abstract class ElectronicKeysService {
  Future<Either> getElectronicKeys();
  
}

class ElectronicKeysServiceImpl implements ElectronicKeysService {
  @override
  Future<Either> getElectronicKeys() async {
    try {
      var mainCollection =
          await FirebaseFirestore.instance.collection('Rooms').get();
      List<ElectronicKeyModel> models = [];
      for (var element in mainCollection.docs) {
        models.add(ElectronicKeyModel.fromMap(element.data()));
      }
      return Right(models);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
