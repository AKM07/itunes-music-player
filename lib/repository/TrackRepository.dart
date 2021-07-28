import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_skeleton/model/response/ArtistResponse.dart';

import '../constants/UrlConstants.dart';
import '../model/response/BaseResponse.dart';
import '../utils/injector.dart';

class TrackRepository {
  final Dio dio = locator<Dio>();

  Future<BaseResponse<ArtistResponse>> getTrackList(String _artistName) async {
    try {
      Response response = await dio.get(UrlConstants.SEARCH_ARTIST_URL,
          queryParameters: {'term': _artistName, 'entity': 'musicTrack'});
      var trackResponse = jsonDecode(response.data);
      return BaseResponse<ArtistResponse>.fromJson(
          trackResponse, ArtistResponse.fromJson);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
