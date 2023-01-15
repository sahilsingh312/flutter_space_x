import 'package:intl/intl.dart';

class LaunchDetails {
  final String missionName;
  final String flightNumber;
  final String rocketName;
  final DateTime launchDate;
  final String launchDateHumanReadable;

  LaunchDetails({
    required this.flightNumber,
    required this.missionName,
    required this.rocketName,
    required this.launchDate,
  }) : launchDateHumanReadable = DateFormat.yMMMd().format(launchDate);

  factory LaunchDetails.fromJson(Map<String, dynamic> json) {
    return LaunchDetails(
      missionName: json['name'],
      flightNumber: json['flight_number'].toString(),
      rocketName: json['rocket'],
      launchDate: DateTime.parse(json['date_utc']),
    );
  }
}
