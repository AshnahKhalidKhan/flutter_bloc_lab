import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_lab/bloc/user_bloc.dart';
import 'package:flutter_bloc_lab/bloc/user_events.dart';
import 'package:flutter_bloc_lab/bloc/user_states.dart';
import 'package:flutter_bloc_lab/model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'user_repo_moc.dart';

void main()
{
  group
  (
    'Search repo bloc test',
    () 
    {
      late UserBloc mocBloc;
      late MockUserRepo mocRepo;
      setUpAll(()
      {
        mocRepo = MockUserRepo();
        mocBloc = UserBloc(userRepository: mocRepo);
      });
      blocTest
      (
        'emit [UserLoading, userLoaded]',
        build: () => mocBloc,
        act: (bloc) => bloc.add(const FetchUser()),
        expect:
        (() =>
          [
            UserLoading(),
            UserLoaded(user: [User()])
          ]
        )
      ); 
      tearDown(()
      {
        mocBloc.close();
      });
    }
  );
}