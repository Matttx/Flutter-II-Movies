import 'dart:async';

import 'package:movies/resources/api_repository.dart';
import 'package:movies/src/models/user.dart';

enum UserAction { Fetch }

class UserBloc {
  String jwt;
  final ApiRepository _apiRepo = ApiRepository();

  final _userStateController = StreamController<User>();

  StreamSink<User> get _userSink => _userStateController.sink;

  Stream<User> get user => _userStateController.stream;

  final _userEventController = StreamController<UserAction>();

  StreamSink<UserAction> get userEventSink => _userEventController.sink;

  Stream<UserAction> get _userEventStream => _userEventController.stream;

  UserBloc({required this.jwt}) {
    _userEventStream.listen(_mapEventToState);
  }

  void _mapEventToState(UserAction event) async {
    if (event == UserAction.Fetch) {
      try {
        User userInfos = await _apiRepo.fetchUser(jwt);
        _userSink.add(userInfos);
      } on Exception catch (_) {
        _userSink.addError("Something went wrong");
      }
    }
  }
}
