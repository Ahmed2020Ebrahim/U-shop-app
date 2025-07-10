import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/repositories/authentication_repository/authentication_repository.dart';
import 'firebase_options.dart';

void main() async {
  //Todo : widget bindings
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Todo : local Storage initlaize
  await GetStorage.init();

  //Todo : await splash untel other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Todo : firebase intialize
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));

  //Todo : App Entry point
  runApp(const App());
}
