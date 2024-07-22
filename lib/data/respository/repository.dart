import 'dart:async';

import 'package:sipatex_mobile_challenge/data/model/user_model.dart';

abstract interface class Repository {
  FutureOr<UserModel?> getUser(int page);
}
