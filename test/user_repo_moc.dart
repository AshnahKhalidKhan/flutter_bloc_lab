

import 'package:flutter_bloc_lab/core/network.dart';
import 'package:flutter_bloc_lab/core/repository/user_repo.dart';
import 'package:flutter_bloc_lab/model/product_model.dart';
import 'package:flutter_bloc_lab/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

class MockUserRepo implements UserRepository
{

  @override
  Future<List<User>> getUserRepo()
  {
    return Future.value([User()]);
  }

  @override
  Future<List<User>> getUser()
  {
    return Future.value([User()]);
  }

  @override
  UserApiClient get userApiClient => throw UnimplementedError();
  
}