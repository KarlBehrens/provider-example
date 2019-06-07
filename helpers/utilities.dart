import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:experiments/provider/model/location.dart';

final firestoreWondersInstance = Firestore.instance;
final locationStreamInstance = LocationStream();

const wonderCollection = 'wonders';
const fifthWonderDoc = 'fifth';

class LocationStream {
  ///All the backend streams related to Locations.
  LocationStream();

  Stream<DocumentSnapshot> userDataStream(
      {String documentId = fifthWonderDoc}) {
    return firestoreWondersInstance
        .collection(wonderCollection)
        .document(documentId)
        .snapshots();
  }

  ///For documents.....
  Stream<LocationModelAdvanced> locationInfo() {
    final _listModel = userDataStream()
        .map((list) => LocationModelAdvanced.fromMap(list.data));

    return _listModel;
  }

  Stream<List<LocationModelAdvanced>> allLocations(
      {String collectionId = wonderCollection}) {
    final _collRef =
        firestoreWondersInstance.collection(collectionId).snapshots();

    final _listModel = _collRef.map((list) => list.documents
        .map((doc) => LocationModelAdvanced.fromSnapshot(doc))
        .toList());

    return _listModel;
  }

  ///For documents.....
  Stream<LocationModelNormal> specificLocation(String docId) {
    final _listModel = userDataStream(
      documentId: docId,
    ).map((list) => LocationModelNormal.fromMap(list.data));

    return _listModel;
  }
}

///Sets the user...
class CurrentUser {
  static String docId = '';
  void dummy() {}
}
