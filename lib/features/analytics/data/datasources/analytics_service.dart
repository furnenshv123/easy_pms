import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_pms/features/analytics/data/models/analytic_model.dart';
import 'package:easy_pms/features/reservation/data/models/guest_req_model.dart';
import 'package:intl/intl.dart';

abstract class AnalyticsService {
  Future<Either> getAllAnalytics();
}

class AnalyticsServiceImpl implements AnalyticsService {
  @override
  Future<Either> getAllAnalytics() async {
    try {
      var rooms = await FirebaseFirestore.instance.collection('Rooms').get();
      List<GuestReqModel> allGuests = [];
      int priceFromReservation = 0;
      int priceForServices = 0;
      for (var element in rooms.docs) {
        var guest = await element.reference.collection('Guests').get();
        allGuests
            .addAll(guest.docs.map((e) => GuestReqModel.fromMap(e.data())));
      }
      for (var guest in allGuests) {
        DateTime start =
            DateFormat('dd.MM.yyyy').parse(guest.reservationStart ?? '');
        DateTime end =
            DateFormat('dd.MM.yyyy').parse(guest.reservationEnd ?? '');
        Duration difference = end.difference(start);
        int days = difference.inDays;
        if (guest.tariff == 'Single') {
          priceFromReservation += days * 50;
        } else if (guest.tariff == 'Twin') {
          priceFromReservation += days * 80;
        } else if (guest.tariff == 'Double') {
          priceFromReservation += days * 100;
        } else {
          priceFromReservation += days * 250;
        }
        if (guest.service == 'Pool') {
          priceForServices +=days*  15;
        } else if (guest.service == 'Gym') {
          priceForServices +=days * 10;
        } else {
          priceForServices +=days * 20;
        }
      }
      return Right(AnalyticModel(
          priceFromReservation: priceFromReservation,
          priceFromServices: priceForServices));
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
