// import 'dart:async';
// import 'dart:developer' as developer;

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class ConnectivityStateBuilder extends StatefulWidget {
//   final Widget Function(
//     Rx<ConnectivityResult> result,
//   ) builder;
//   const ConnectivityStateBuilder({
//     super.key,
//     required this.builder,
//   });

//   @override
//   State<ConnectivityStateBuilder> createState() =>
//       _ConnectivityStateBuilderState();
// }

// class _ConnectivityStateBuilderState extends State<ConnectivityStateBuilder> {
//   final Rx<ConnectivityResult> _connectionStatus =
//       ConnectivityResult.mobile.obs;
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;

//   @override
//   void initState() {
//     super.initState();
//     initConnectivity();
//     _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
//             _updateConnectionStatus as void Function(
//                 List<ConnectivityResult> event)?)
//         as StreamSubscription<ConnectivityResult>;
//   }

//   @override
//   void dispose() {
//     _connectivitySubscription.cancel();
//     super.dispose();
//   }

//   Future<void> initConnectivity() async {
//     late ConnectivityResult result;

//     try {
//       result = (await _connectivity.checkConnectivity()) as ConnectivityResult;
//     } on PlatformException catch (e) {
//       developer.log('Couldn\'t check connectivity status', error: e);
//       return;
//     }
//     if (!mounted) {
//       return Future.value(null);
//     }
//     return _updateConnectionStatus(result);
//   }

//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     if (result != ConnectivityResult.none) {
//       _connectionStatus.value = result;
//     } else {
//       _connectionStatus.value = ConnectivityResult.none;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.builder(_connectionStatus);
//   }
// }
