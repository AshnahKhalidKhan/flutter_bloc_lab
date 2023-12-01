import 'package:flutter_bloc_lab/core/network.dart';
import 'package:flutter_bloc_lab/model/user_model.dart';

class UserRepository
{
  final UserApiClient userApiClient;

  UserRepository
  (
    {
      required this.userApiClient
    }
  );

  Future<List<User>> getUser() async
  {
    return userApiClient.fetchuser();
  }
}