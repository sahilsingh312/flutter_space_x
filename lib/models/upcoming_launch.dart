import 'package:intl/intl.dart';

class UpcomingLaunch {
  final String missionName;
  final String missionPatch;
  final String id;
  final String rocketName;
  final DateTime launchDate;
  final String launchDateHumanReadable;

  UpcomingLaunch({
    required this.missionName,
    required this.missionPatch,
    required this.id,
    required this.rocketName,
    required this.launchDate,
  }) : launchDateHumanReadable = DateFormat.yMMMd().format(launchDate);

  factory UpcomingLaunch.fromJson(Map<String, dynamic> json) {
    return UpcomingLaunch(
      missionName: json['name'],
      missionPatch: json['links']['patch']['small'] ??
          'https://cdn.pixabay.com/photo/2018/03/26/14/07/space-3262811_1280.jpg',
      id: json['id'],
      rocketName: json['rocket'],
      launchDate: DateTime.parse(json['date_utc']),
    );
  }
}
