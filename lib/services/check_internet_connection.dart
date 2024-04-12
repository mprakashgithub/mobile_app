import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> hasInternetAccess() async {
  try {
    return await InternetConnectionChecker().hasConnection;
  } catch (e) {
    return false;
  }
}

Future<bool> get isNetworkAvailable async => await hasInternetAccess();
Future<bool> get isNetworkOffline async => !(await isNetworkAvailable);
