import 'package:flutter/material.dart';

import '../apis/spacex_api.dart';
import '../models/launch_details.dart';
import '../models/upcoming_launch.dart';

class LaunchesProvider with ChangeNotifier {
  List<UpcomingLaunch> _launches = [];

  final SpaceXApi _spaceXApi = SpaceXApi();

  List<UpcomingLaunch> get launches => _launches;
  Map<String, LaunchDetails> _launchDetails = {};

  void setLaunches(List<UpcomingLaunch> launches) {
    _launches = launches;
    notifyListeners();
  }

  Future<List<UpcomingLaunch>> fetchLaunches() async {
    final launches = await _spaceXApi.fetchUpcomingLaunches();
    setLaunches(launches);
    return launches;
  }

  Future<LaunchDetails> fetchLaunchDetails(String id) async {
    final launchDetails = await _spaceXApi.fetchLaunchDetails(id);
    return launchDetails;
  }
}
