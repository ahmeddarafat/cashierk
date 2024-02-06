import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:start_app/data/data_source/remote/firebase_service.dart';

import 'resources/configs/firebase_options.dart';
import 'resources/observers/bloc_observer.dart';
import 'resources/service_locator/service_locator.dart';

import "app.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init bloc observer
  Bloc.observer = MyBlocObserver();

  /// init bloc storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  /// init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// init notifications
  final firebaseService = FirebaseService();
  await firebaseService.initNotification();

  /// init service locator
  await initModule();

  runApp(const MyApp());
}





  /// notes
  
  /// 1. remove the cache data to reset the app
  /// var appDir = (await getApplicationDocumentsDirectory()).path;
  /// Directory(appDir).delete(recursive: true);