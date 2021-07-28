// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ArtistResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistResponse _$ArtistResponseFromJson(Map<String, dynamic> json) {
  return ArtistResponse(
    wrapperType: json['wrapperType'] as String?,
    kind: json['kind'] as String?,
    artistId: (json['artistId'] as num?)?.toDouble(),
    collectionId: (json['collectionId'] as num?)?.toDouble(),
    trackId: (json['trackId'] as num?)?.toDouble(),
    artistName: json['artistName'] as String?,
    collectionName: json['collectionName'] as String?,
    trackName: json['trackName'] as String?,
    collectionCensoredName: json['collectionCensoredName'] as String?,
    trackCensoredName: json['trackCensoredName'] as String?,
    artistViewUrl: json['artistViewUrl'] as String?,
    collectionViewUrl: json['collectionViewUrl'] as String?,
    trackViewUrl: json['trackViewUrl'] as String?,
    previewUrl: json['previewUrl'] as String?,
    artworkUrl30: json['artworkUrl30'] as String?,
    artworkUrl60: json['artworkUrl60'] as String?,
    artworkUrl100: json['artworkUrl100'] as String?,
    collectionPrice: (json['collectionPrice'] as num?)?.toDouble(),
    trackPrice: (json['trackPrice'] as num?)?.toDouble(),
    releaseDate: json['releaseDate'] as String?,
    collectionExplicitness: json['collectionExplicitness'] as String?,
    trackExplicitness: json['trackExplicitness'] as String?,
    discCount: (json['discCount'] as num?)?.toDouble(),
    discNumber: (json['discNumber'] as num?)?.toDouble(),
    trackCount: (json['trackCount'] as num?)?.toDouble(),
    trackNumber: (json['trackNumber'] as num?)?.toDouble(),
    trackTimeMillis: (json['trackTimeMillis'] as num?)?.toDouble(),
    country: json['country'] as String?,
    currency: json['currency'] as String?,
    primaryGenreName: json['primaryGenreName'] as String?,
    isStreamable: json['isStreamable'] as bool?,
    nowPlaying: json['nowPlaying'] as bool?,
  );
}

Map<String, dynamic> _$ArtistResponseToJson(ArtistResponse instance) =>
    <String, dynamic>{
      'wrapperType': instance.wrapperType,
      'kind': instance.kind,
      'artistId': instance.artistId,
      'collectionId': instance.collectionId,
      'trackId': instance.trackId,
      'artistName': instance.artistName,
      'collectionName': instance.collectionName,
      'trackName': instance.trackName,
      'collectionCensoredName': instance.collectionCensoredName,
      'trackCensoredName': instance.trackCensoredName,
      'artistViewUrl': instance.artistViewUrl,
      'collectionViewUrl': instance.collectionViewUrl,
      'trackViewUrl': instance.trackViewUrl,
      'previewUrl': instance.previewUrl,
      'artworkUrl30': instance.artworkUrl30,
      'artworkUrl60': instance.artworkUrl60,
      'artworkUrl100': instance.artworkUrl100,
      'collectionPrice': instance.collectionPrice,
      'trackPrice': instance.trackPrice,
      'releaseDate': instance.releaseDate,
      'collectionExplicitness': instance.collectionExplicitness,
      'trackExplicitness': instance.trackExplicitness,
      'discCount': instance.discCount,
      'discNumber': instance.discNumber,
      'trackCount': instance.trackCount,
      'trackNumber': instance.trackNumber,
      'trackTimeMillis': instance.trackTimeMillis,
      'country': instance.country,
      'currency': instance.currency,
      'primaryGenreName': instance.primaryGenreName,
      'isStreamable': instance.isStreamable,
      'nowPlaying': instance.nowPlaying,
    };
