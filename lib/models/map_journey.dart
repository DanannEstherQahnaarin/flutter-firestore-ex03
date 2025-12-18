import 'package:cloud_firestore/cloud_firestore.dart';

class MapJourney {
  final double sourceLat;
  final double sourceLng;
  final double destinationLat;
  final double destinationLng;
  final int? distanceMeters; // Optional: Initially null
  final int? durationSeconds; // Optional: Initially null
  final Timestamp timestamp;

  MapJourney({required this.sourceLat, required this.sourceLng, required this.destinationLat, required this.destinationLng, this.distanceMeters, this.durationSeconds, required this.timestamp});

  // Firestore Map으로 변환
  Map<String, dynamic> toMap() {
    return {
      'sourceLat': sourceLat,
      'sourceLng': sourceLng,
      'destinationLat': destinationLat,
      'destinationLng': destinationLng,
      'distanceMeters': distanceMeters,
      'durationSeconds': durationSeconds,
      'timestamp': timestamp,
    };
  }

  // Firestore Snapshot에서 객체 생성
  factory MapJourney.fromMap(Map<String, dynamic> map) {
    return MapJourney(
      sourceLat: map['sourceLat'] as double,
      sourceLng: map['sourceLng'] as double,
      destinationLat: map['destinationLat'] as double,
      destinationLng: map['destinationLng'] as double,
      distanceMeters: map['distanceMeters'] as int?,
      durationSeconds: map['durationSeconds'] as int?,
      timestamp: map['timestamp'] as Timestamp,
    );
  }
}
