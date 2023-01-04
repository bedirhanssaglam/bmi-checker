import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bmi_check/core/constants/enums/network_enums.dart';

abstract class IFireService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> fetchWeakenAdvices();
  Stream<QuerySnapshot> fetchGettingFatAdvices();
  Stream<DocumentSnapshot> fetchSleepBlog();
  Stream<DocumentSnapshot> fetchSportBlog();
}

class FireService extends IFireService {
  @override
  Stream<QuerySnapshot> fetchWeakenAdvices() {
    var ref =
        _firestore.collection(NetworkEnums.weakenAdvices.name).snapshots();
    return ref;
  }

  @override
  Stream<QuerySnapshot> fetchGettingFatAdvices() {
    var ref =
        _firestore.collection(NetworkEnums.gettingFatAdvices.name).snapshots();
    return ref;
  }

  @override
  Stream<DocumentSnapshot> fetchSleepBlog() {
    var ref = _firestore
        .collection('sleep')
        .doc(NetworkEnums.sleeping.name)
        .snapshots();
    return ref;
  }

  @override
  Stream<DocumentSnapshot> fetchSportBlog() {
    var ref = _firestore
        .collection('sport')
        .doc(NetworkEnums.sporting.name)
        .snapshots();
    return ref;
  }
}
