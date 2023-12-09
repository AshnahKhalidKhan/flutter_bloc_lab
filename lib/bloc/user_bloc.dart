import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/bloc/user_events.dart';
import 'package:flutter_bloc_lab/bloc/user_states.dart';
import 'package:flutter_bloc_lab/core/repository/user_repo.dart';
import 'package:flutter_bloc_lab/model/product_model.dart';
import 'package:flutter_bloc_lab/model/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState>
{
  final UserRepository userRepository;

  UserBloc
  (
    {
      required this.userRepository
    }
  )
  : super(UserLoading())
  {
    on<FetchUser> ((event, emit) async
    {
      await _getUser(emit);
    },
    );
    // on<FetchProducts> ((event, emit) async
    // {
    //   await _getUser(emit);
    // },
    // );
  }

  Future<void> _getUser(Emitter<UserState> emit) async
  {
    emit(UserLoading());
    try
    {
      final List<User> user =  await userRepository.getUser();
      // final List<Products> user = await userRepository.getProducts();
      emit(UserLoaded(user: user));
    }
    catch (e)
    {
      emit(UserError(error: e.toString()));
    }
  }
}

