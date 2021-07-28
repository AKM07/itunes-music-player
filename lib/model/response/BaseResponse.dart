import '../LoadApiStatus.dart';

class BaseResponse<T> {
  int? resultCount;
  List<T>? results;
  String? error;
  LoadApiStatus? loadStatus;

  BaseResponse({this.resultCount, this.results, this.error});

  BaseResponse.loading() : loadStatus = LoadApiStatus.LOADING;

  BaseResponse.completed(this.results) : loadStatus = LoadApiStatus.COMPLETED;

  BaseResponse.error() : loadStatus = LoadApiStatus.ERROR;

  factory BaseResponse.fromJson(
      Map<String, dynamic> jsonData, Function fromJson) {
    final items = jsonData['results'];

    List<T> output = [];

    if (items is Iterable) {
      for (Map<String, dynamic> json in items) {
        output.add(fromJson(json));
      }
    } else {
      output.add(fromJson(items));
    }

    return BaseResponse<T>(
      resultCount: jsonData["resultCount"],
      results: output,
    );
  }

  BaseResponse.withError(String errorValue)
      : resultCount = 0,
        results = [],
        error = errorValue;
}
