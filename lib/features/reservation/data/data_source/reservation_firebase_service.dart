import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pms/config/logger/logger.dart';
import 'package:easy_pms/features/electronic_keys/data/models/electronic_key_model.dart';

import 'package:easy_pms/features/reservation/data/models/guest_req_model.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class ReservationFirebaseService {
  Future<Either> addGuest(GuestReqModel model);
  Future<Either> getGuests();
  Future<Either> getGuestByRoom(int? roomNumber);
  Future<Either> changeGuestInfo(GuestReqModel model);
  Future<Either> deleteGuest(GuestReqModel model);
}

class ReservationFirebaseServiceImpl implements ReservationFirebaseService {
  @override
  Future<Either> addGuest(GuestReqModel model) async {
    try {
      var number = await FirebaseFirestore.instance
          .collection('Rooms')
          .where('Type', isEqualTo: model.tariff)
          .get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> target = [];
      for (var element in number.docs) {

        var subCollection = element.reference.collection('Guests');
        var subCollectionSnapshot = await subCollection.get();
        if (subCollectionSnapshot.docs.isEmpty) {
          logger.d(element.id);
          target.add(element);
        }
      }

      if (target.isEmpty) {
        return Right('Комнаты с таким тарифом уже заняты!');
      } else {
        var setDoc = target[0];
        logger.d(setDoc.id);
        model.roomNumber = int.parse(setDoc.id);
        setDoc.reference.update(ElectronicKeyModel(name: model.name, roomNumber: model.roomNumber, isActive: true, type: model.tariff).toMap());
        setDoc.reference
            .collection('Guests')
            .doc('${model.name}:${model.reservationEnd}')
            .set(model.toMap());
        return const Right('Регистрация успешно выполнена :)');
      }
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> getGuests() async {
    try {
      var mainCollection =
          await FirebaseFirestore.instance.collection('Rooms').get();
      List<GuestReqModel> guests = [];

      for (var element in mainCollection.docs) {
        var subCollection = element.reference.collection('Guests');
        var subCollectionSnapshot = await subCollection.get();
        guests.addAll(subCollectionSnapshot.docs.map(
          (e) => GuestReqModel.fromMap(e.data()),
        ));
      }

      return Right(guests);
    } on FirebaseException catch (e) {
      logger.e(e);
      return Left(e);
    }
  }

  @override
  Future<Either> getGuestByRoom(int? roomNumber) async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('Rooms')
          .doc(roomNumber.toString())
          .collection('Guests')
          .get();
      var guest = response.docs
          .map(
            (e) => GuestReqModel.fromMap(e.data()),
          )
          .single;
      return Right(guest);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> changeGuestInfo(GuestReqModel model) async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('Rooms')
          .doc(model.roomNumber.toString())
          .collection('Guests')
          .doc()
          .set(model.toMap());
      return const Right('Success');
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either> deleteGuest(GuestReqModel model) async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('Rooms')
          .doc(model.roomNumber.toString())
          .collection('Guests')
          .doc('${model.name}:${model.reservationEnd}')
          .delete();
      return Right('Удаление успешно!');
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
