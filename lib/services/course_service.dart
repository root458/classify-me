import 'dart:convert';
import 'dart:io';

import 'package:classifyme/models/_index.dart';
import 'package:classifyme/utils/_index.dart';

abstract class CourseService {
  Future<Recommendations> getCourseRecommendations(UserData userData);
  Future<void> setInterests();
}

NetworkUtil _networkUtil = NetworkUtil();

class CourseServiceImpl implements CourseService {
  @override
  Future<Recommendations> getCourseRecommendations(UserData userData) async {
    final _endpointUrl = '/recommendations';

    try {
      final _resp = await _networkUtil.postReq(
        _endpointUrl,
        body: json.encode(
          userData.toJson(),
        ),
      );
      return Recommendations.fromJson(_resp);
    } on SocketException {
      throw ('Check network connection!');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> setInterests() async {
    final _endpointUrl = '/recommendations';

    try {
      // ignore: unused_local_variable
      final _resp = await _networkUtil.postReq(
        _endpointUrl,
        body: json.encode(
          {},
        ),
      );
      // return Events.fromJson(  _resp);
    } on SocketException {
      throw ('Check network connection!');
    } catch (e) {
      rethrow;
    }
  }
}
