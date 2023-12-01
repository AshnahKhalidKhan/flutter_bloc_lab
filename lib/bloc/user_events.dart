import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable
{
  const UserEvent
  (
    [
      List props = const []
    ]
  )
  : super();
}
  
class FetchUser extends UserEvent
{
  const FetchUser() : super();
  
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FetchProducts extends UserEvent
{
  const FetchProducts() : super();
  
  @override
  List<Object?> get props => throw UnimplementedError();
}