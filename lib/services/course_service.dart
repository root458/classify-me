import 'dart:convert';
import 'dart:io';

import 'package:classifyme/utils/network.dart';

abstract class CourseService {
  Future<void> getCourseRecommendations();
  Future<void> setInterests();
}

NetworkUtil _networkUtil = NetworkUtil();

class CourseServiceImpl implements CourseService {
  @override
  Future<void> getCourseRecommendations() async {
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
