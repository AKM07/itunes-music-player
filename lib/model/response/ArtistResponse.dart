import 'package:json_annotation/json_annotation.dart';

part 'ArtistResponse.g.dart';

@JsonSerializable()
class ArtistResponse {
  String? wrapperType;
  String? kind;
  double? artistId;
  double? collectionId;
  double? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  double? discCount;
  double? discNumber;
  double? trackCount;
  double? trackNumber;
  double? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;
  bool? isStreamable;
  bool? nowPlaying;

  ArtistResponse({
    this.wrapperType,
    this.kind,
    this.artistId,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.trackViewUrl,
    this.previewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.discCount,
    this.discNumber,
    this.trackCount,
    this.trackNumber,
    this.trackTimeMillis,
    this.country,
    this.currency,
    this.primaryGenreName,
    this.isStreamable,
    this.nowPlaying,
  });

  Map<String, dynamic> toJson() => _$ArtistResponseToJson(this);

  static ArtistResponse fromJson(Map<String, dynamic> json) =>
      _$ArtistResponseFromJson(json);
}