import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_demos/bloc_to_bloc/constants/enums.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}
