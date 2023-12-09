import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_lab/model/product_model.dart';
import 'package:flutter_bloc_lab/model/user_model.dart';

abstract class UserState extends Equatable
{
  const UserState
  (
    [
      List props = const []
    ]
  )
  : super();

  @override
  List<Object> get props => [];
}

class UserEmpty extends UserState
{
  //Ye empty rahay ga
}

class UserLoading extends UserState
{
  //Ye empty rahay ga
}

class UserLoaded extends UserState
{
  final List<User> user;
  // final List<Products> user;

  UserLoaded
  (
    {
      required this.user
    }
  )
  : super([user]);
}

class UserError extends UserState 
{
  final String? error;
  UserError
  (
    {
      this.error
    }
  );
}