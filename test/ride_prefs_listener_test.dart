import 'dart:io';
 
 import 'package:w5/EXERCISE-1/listeners/ride_prefs_listener.dart';
 import 'package:w5/EXERCISE-1/model/ride_pref/ride_pref.dart';
 import 'package:w5/EXERCISE-1/repository/mock/mock_ride_preferences_repository.dart';
 import 'package:w5/EXERCISE-1/service/ride_prefs_service.dart';
 import 'package:w5/EXERCISE-1/dummy_data/dummy_data.dart';
 
 class ConsoleLogger extends RidePrefsListener {
   @override
   void onPreferenceSelected(RidePreference selectedPreference) {
     // ignore: avoid_print
     print("ConsoleLogger: New preference $selectedPreference");
   }
 }
 
 void main() {
   RidePrefService.initialize(MockRidePreferencesRepository());
 
   ConsoleLogger logger = ConsoleLogger();
   RidePrefService.addListener(logger);
 
   RidePrefService.instance.setCurrentPreference(fakeRidePrefs[0]);
   sleep(const Duration(seconds: 1));
   RidePrefService.instance.setCurrentPreference(fakeRidePrefs[1]);
   sleep(const Duration(seconds: 1));
   RidePrefService.instance.setCurrentPreference(fakeRidePrefs[2]);
 }