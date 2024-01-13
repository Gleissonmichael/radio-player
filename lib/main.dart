import 'package:flutter/material.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:flutter_radio_player/models/frp_source_modal.dart';
import 'package:player/frp_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RadioApp(),
    );
  }
}

class RadioApp extends StatefulWidget {
  const RadioApp({super.key});

  @override
  RadioAppState createState() => RadioAppState();
}

class RadioAppState extends State<RadioApp> {
  TextEditingController controllerText = TextEditingController();
  double volume = 0.5;
  final FlutterRadioPlayer _flutterRadioPlayer = FlutterRadioPlayer();

  final FRPSource frpSource = FRPSource(
    mediaSources: <MediaSources>[
      MediaSources(
          url: "http://s12.maxcast.com.br:8078/autodj",
          description: "Essa é a rádio da sua vida",
          isPrimary: true,
          title: "Rádio SESC RJ",
          isAac: true),
      MediaSources(
          url: 'https://shout25.crossradio.com.br:18066/live',
          description: "Correio SAT",
          isPrimary: false,
          title: "FM Correio",
          isAac: true),
      MediaSources(
          url: 'https://ice.fabricahost.com.br/radiobahiafm',
          description: "Rádio Bahia FM 88.7 - Salvador / BA - Brasil",
          isPrimary: false,
          title: "Rádio Bahia FM",
          isAac: true),
      MediaSources(
          url: 'https://8157.brasilstream.com.br/stream',
          description: "Rede Clube FM - Tá na clube, tá bom demais!",
          isPrimary: false,
          title: "Clube Rede FM",
          isAac: true),
    ],
  );

  @override
  void initState() {
    super.initState();
    _play();
  }

  Future<void> _play() async {
    _flutterRadioPlayer.initPlayer();
    _flutterRadioPlayer.addMediaSources(frpSource);
  }

  void onSubmit(String value) async {
    _flutterRadioPlayer.pause();

    FRPSource newFrpSource = FRPSource(
      mediaSources: <MediaSources>[
        MediaSources(
            url: "http://s12.maxcast.com.br:8078/autodj",
            description: "Stream with ICY2",
            isPrimary: true,
            title: "Test2",
            isAac: false),
      ],
    );

    _flutterRadioPlayer.addMediaSources(newFrpSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rádio teste - ED - SESC"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          // const SizedBox(height: 120),
          // const Text("Adicione sua Rádio"),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
          //   child: TextFormField(
          //     controller: controllerText,
          //     onFieldSubmitted: (value) {
          //       onSubmit(value);
          //     },
          //     decoration: InputDecoration(
          //         alignLabelWithHint: true,
          //         contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          //         border: OutlineInputBorder(
          //             borderRadius: BorderRadius.circular(5.0),
          //             borderSide: const BorderSide(width: 1)),
          //         focusedBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(5.0),
          //           borderSide: const BorderSide(width: 1, color: Colors.black),
          //         ),
          //         filled: true,
          //         counterText: ""),
          //   ),
          // ),
          // IconButton(
          //   icon: const Icon(Icons.add),
          //   onPressed: () {
          //     onSubmit(controllerText.text);
          //   },
          // ),
          // IconButton(
          //   icon: const Icon(Icons.skip_next),
          //   onPressed: () {
          //     _flutterRadioPlayer.next();
          //   },
          // ),
          const SizedBox(height: 120),
          const Text("Tocando agora"),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(
          //       icon: const Icon(Icons.volume_down),
          //       iconSize: 20,
          //       onPressed: () {
          //         if (volume > 0) {
          //           volume = volume - 0.25;
          //           _flutterRadioPlayer.setVolume(volume);
          //         }
          //       },
          //     ),
          //     IconButton(
          //       icon: const Icon(Icons.play_arrow),
          //       iconSize: 70,
          //       onPressed: () {
          //         _flutterRadioPlayer.play();
          //       },
          //     ),
          //     IconButton(
          //       icon: const Icon(Icons.pause),
          //       iconSize: 50,
          //       onPressed: () {
          //         _flutterRadioPlayer.pause();
          //       },
          //     ),
          //     IconButton(
          //         icon: const Icon(Icons.volume_up),
          //         iconSize: 20,
          //         onPressed: () {
          //           if (volume < 1) {
          //             volume = volume + 0.25;
          //             _flutterRadioPlayer.setVolume(volume);
          //           }
          //         }),
          //   ],
          // ),
          FRPlayer(
            flutterRadioPlayer: _flutterRadioPlayer,
            frpSource: frpSource,
            useIcyData: true,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // audioPlayer.dispose();
    super.dispose();
  }
}
