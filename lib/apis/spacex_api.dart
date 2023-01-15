import 'package:dio/dio.dart';
import 'package:flutter_space_x/apis/base_api.dart';

import '../models/launch_details.dart';
import '../models/upcoming_launch.dart';

class SpaceXApi extends BaseApi {
  static const String _baseUrl = "https://api.spacexdata.com/v4/";
  SpaceXApi() : super(baseUrl: _baseUrl);

  String createUpcomingLaunchesUrl() {
    return '/launches/upcoming';
  }

  String createDetailsUrl(String id) {
    return '/launches/$id';
  }

  Future<List<UpcomingLaunch>> fetchUpcomingLaunches() async {
    final url = createUpcomingLaunchesUrl();
    final response = await get(url);
    if (response.statusCode == 200) {
      final List<dynamic> json = response.data;
      return json.map((e) => UpcomingLaunch.fromJson(e)).toList();
    } else {
      throw Exception("Error fetching launches");
    }
  }

  Future<LaunchDetails> fetchLaunchDetails(String id) async {
    final url = createDetailsUrl(id);
    final response = await get(url);
    if (response.statusCode == 200) {
      final json = response.data;
      return LaunchDetails.fromJson(json);
    } else {
      throw Exception("Error fetching launch details");
    }
  }
}
