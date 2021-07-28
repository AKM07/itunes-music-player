import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobile_skeleton/bloc/TrackBloc.dart';
import 'package:mobile_skeleton/components/CommonLoadingWidget.dart';
import 'package:mobile_skeleton/model/response/ArtistResponse.dart';

import '../model/LoadApiStatus.dart';
import '../model/response/BaseResponse.dart';
import '../utils/SizeUtil.dart';

class MusicPlayerPage extends StatefulWidget {
  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  TextEditingController _searchController = new TextEditingController();
  final AudioPlayer _player = AudioPlayer();
  bool _showMediaController = false;
   double _lastTrackId = 0;

  @override
  void initState() {
    trackBloc.getTrackList("green");
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    trackBloc.disposeTrackList();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtil().init(context);
    double defaultSize = SizeUtil.defaultSize;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: SizeUtil.screenWidth,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _searchWidget(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: StreamBuilder(
                      stream: trackBloc.trackListSubject.stream,
                      builder: (context,
                          AsyncSnapshot<BaseResponse<ArtistResponse>>
                              snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.loadStatus ==
                              LoadApiStatus.LOADING) {
                            return CommonLoadingWidget();
                          } else if (snapshot.data!.loadStatus ==
                              LoadApiStatus.COMPLETED) {
                            return _trackListWidget(
                                defaultSize, snapshot.data!.results!);
                          } else if (snapshot.data!.loadStatus ==
                              LoadApiStatus.ERROR) {
                            return Container(
                              height: defaultSize * 20,
                            );
                          } else {
                            return Container(height: defaultSize * 20);
                          }
                        } else {
                          return Container(height: defaultSize * 20);
                        }
                      })),
              _showMediaController
                  ? _mediaControllerWidget(defaultSize)
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initPlayer(String _audioSource) async {
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(_audioSource)));
      _player.play();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  Widget _searchWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        color: Color(0xFFF5F6F8),
        border: Border.all(color: Color(0xFFEFEFEF)),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          if (value != "") {
            setState(() {
              if (!_player.playing) {
                _showMediaController = false;
              }
            });
            trackBloc.getTrackList(value);
          }
        },
        decoration: InputDecoration(
          hintText: "Search artist",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color(0xFFEFEFEF),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color(0xFFEFEFEF),
            ),
          ),
          filled: true,
          fillColor: Color(0xFFF5F6F8),
        ),
      ),
    );
  }

  Widget _trackListWidget(double defaultSize, List<ArtistResponse> data) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          var trackData = data[index];
          if (data.length == 0) {
            return Center(
              child: Text("No track found."),
            );
          } else {
            return GestureDetector(
              child: Container(
                width: SizeUtil.screenWidth,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(trackData.artworkUrl100!),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          trackData.trackName!,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(trackData.artistName!,
                            style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(trackData.collectionName!,
                            style: TextStyle(color: Colors.white))
                      ],
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    trackData.nowPlaying! && _lastTrackId == trackData.trackId
                        ? Icon(
                            Icons.graphic_eq,
                            color: Colors.white,
                          )
                        : Container()
                  ],
                ),
              ),
              onTap: () {
                _lastTrackId = trackData.trackId!;
                _initPlayer(trackData.previewUrl!);
                setState(() {
                  if (trackData.nowPlaying!) {
                    trackData.nowPlaying = false;
                  } else {
                    trackData.nowPlaying = true;
                  }
                  _showMediaController = true;
                });
              },
            );
          }
        });
  }

  Widget _mediaControllerWidget(double defaultSize) {
    return Container(
      width: SizeUtil.screenWidth,
      height: defaultSize * 5,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            icon: Icon(
              Icons.skip_previous_rounded,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {},
          ),
          StreamBuilder<PlayerState>(
            stream: _player.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  width: 35,
                  height: 35,
                  child: CommonLoadingWidget(),
                );
              } else if (playing != true) {
                return IconButton(
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    _player.play();
                    setState(() {
                      _showMediaController = true;
                    });
                  },
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  icon: Icon(
                    Icons.pause_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    _player.pause();
                  },
                );
              } else {
                return IconButton(
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {
                    _player.seek(Duration.zero);
                    setState(() {
                      _showMediaController = true;
                    });
                  },
                );
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.skip_next_rounded,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
