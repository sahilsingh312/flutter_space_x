import 'package:intl/intl.dart';

class LaunchDetails {
  final String missionName;
  final String flightNumber;
  final String rocketName;
  final String missionPatch;
  final DateTime launchDate;
  final String youtube;
  final String reddit;
  final String launchDateHumanReadable;

  LaunchDetails({
    required this.flightNumber,
    required this.missionName,
    required this.rocketName,
    required this.missionPatch,
    required this.launchDate,
    required this.youtube,
    required this.reddit,
  }) : launchDateHumanReadable = DateFormat.yMMMd().format(launchDate);

  factory LaunchDetails.fromJson(Map<String, dynamic> json) {
    return LaunchDetails(
      missionName: json['name'],
      flightNumber: json['flight_number'].toString(),
      rocketName: json['rocket'],
      missionPatch: json['links']['patch']['small'] ??
          'https://images2.imgbox.com/a9/9a/NXVkTZCE_o.png',
      youtube: json['links']['webcast'] ??
          'https://www.youtube.com/user/spacexchannel',
      reddit: json['links']?['patch']?['reddit']?['campaign'] ??
          'https://www.reddit.com/r/spacex',
      launchDate: DateTime.parse(json['date_utc']),
    );
  }
}
