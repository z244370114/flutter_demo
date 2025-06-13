import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluePage extends StatefulWidget {
  const BluePage({super.key});

  @override
  State<BluePage> createState() => _BluePageState();
}

class _BluePageState extends State<BluePage> {
  var isOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterBluePlus.setLogLevel(LogLevel.verbose, color: false);
    FlutterBluePlus.logs.listen((String s) {
      // send logs anywhere you want
      print('FlutterBluePlus logs = $s');
    });
    initBluetooth();
  }

  initBluetooth() async {
    if (await FlutterBluePlus.isSupported == false) {
      print("Bluetooth not supported by this device");
      return;
    }

    var subscription =
        FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      print(state);
      if (state == BluetoothAdapterState.on) {
        // usually start scanning, connecting, etc
        print("Bluetooth is ON");
      } else {
        // show an error to the user, etc
        print("Bluetooth is OFF or not available");
      }
    });
    subscription.cancel();

    FlutterBluePlus.events.onConnectionStateChanged.listen((event) {
      print('${event.device} ${event.connectionState}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BluePage')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              if (!kIsWeb && Platform.isAndroid) {
                await FlutterBluePlus.turnOn();
                // await FlutterBluePlus.turnOff();
              }
            },
            child: const Text('openBluetooth'),
          ),
          ElevatedButton(
            onPressed: () async {
              var subscription = FlutterBluePlus.onScanResults.listen(
                (results) {
                  if (results.isNotEmpty) {
                    ScanResult r = results.last;
                    print(
                        '${r.device.remoteId}: "${r.advertisementData.advName}" found!');
                  }
                },
                onError: (e) => print(e),
              );
              FlutterBluePlus.cancelWhenScanComplete(subscription);
            },
            child: const Text('onScanResults'),
          ),
        ],
      ),
    );
  }
}
