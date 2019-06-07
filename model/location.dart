import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModelAdvanced {
  ///Converts map to the respective items.
  LocationModelAdvanced.fromMap(Map<String, dynamic> map, {this.reference})
      : name = map['name'],
        url = map['url'],
        coordinates = map['location'],
        videoURL = map['link'];

  LocationModelAdvanced.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(
          snapshot.data,
          reference: snapshot.reference,
        );

  ///Set the document reference of firestore.
  final DocumentReference reference;

  final String name;

  final String url;

  final GeoPoint coordinates;

  final String videoURL;

  static LocationModelAdvanced initialData() {
    return LocationModelAdvanced.fromMap(({
      'name': '',
      'url':
          'https://www.inovex.de/blog/wp-content/uploads/2019/01/Flutter-1-1.png',
      'location': null,
      'link': '',
    }));
  }

  static List<LocationModelAdvanced> initialListData() {
    return [
      LocationModelAdvanced.fromMap(({
        'name': '',
        'url':
            'https://www.inovex.de/blog/wp-content/uploads/2019/01/Flutter-1-1.png',
        'location': null,
        'link': '',
      }))
    ];
  }
}

class LocationModelNormal {
  final String name;

  final String url;

  final GeoPoint coordinates;

  final String videoURL;

  LocationModelNormal({
    this.name,
    this.url,
    this.coordinates,
    this.videoURL,
  });

  factory LocationModelNormal.fromMap(Map<String, dynamic> data) {
    return LocationModelNormal(
      name: data['name'] ?? '',
      url: data['url'] ?? '',
      coordinates: data['location'] ?? null,
      videoURL: data['link'] ?? '',
    );
  }

  factory LocationModelNormal.initialData() {
    return LocationModelNormal(
      coordinates: null,
      name: '',
      videoURL: '',
      url:
          'https://www.inovex.de/blog/wp-content/uploads/2019/01/Flutter-1-1.png',
    );
  }
}
