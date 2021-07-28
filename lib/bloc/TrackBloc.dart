import 'package:mobile_skeleton/model/response/ArtistResponse.dart';
import 'package:mobile_skeleton/repository/TrackRepository.dart';
import 'package:rxdart/rxdart.dart';

import '../model/response/BaseResponse.dart';

class TrackBloc {
  final TrackRepository repository = TrackRepository();
  final BehaviorSubject<BaseResponse<ArtistResponse>> trackListSubject =
      BehaviorSubject<BaseResponse<ArtistResponse>>();

  getTrackList(String _artistName) async {
    trackListSubject.add(BaseResponse.loading());
    try {
      BaseResponse<ArtistResponse> response =
          await repository.getTrackList(_artistName);
      response.results!.forEach((ArtistResponse response) {
        response.nowPlaying = false;
      });
      trackListSubject.add(BaseResponse.completed(response.results));
    } catch (error, stacktrace) {
      trackListSubject.sink.add(BaseResponse.error());
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  disposeTrackList() {
    trackListSubject.close();
  }
}

final trackBloc = TrackBloc();
