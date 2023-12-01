import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/bloc/user_bloc.dart';
import 'package:flutter_bloc_lab/bloc/user_events.dart';
import 'package:flutter_bloc_lab/bloc/user_states.dart';
import 'package:flutter_bloc_lab/core/repository/user_repo.dart';

class UserPage extends StatefulWidget 
{
  final UserRepository userRepository; //
  const UserPage({Key? key, required this.userRepository}) : super(key: key); //

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> 
{
  late UserBloc _userBloc;

  @override
  void initState() 
  {
    super.initState();
    _userBloc = UserBloc(userRepository: widget.userRepository);
    _userBloc.add(const FetchUser());
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Bloc parh rahay hain'),
      ),
      body: Center
      (
        child: BlocBuilder
        (
          bloc: _userBloc,
          builder: (_, UserState state)
          {
            if (state is UserEmpty)
            {
              return const Center(child: Text('Empty state'));
            }
            if (state is UserError)
            {
              return const Text('Error');
            }
            if (state is UserLoading)
            {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserLoaded)
            {
              return ListView.builder
              (
                itemCount: state.user.length,
                itemBuilder: (BuildContext context, int i)
                {
                  var obj = state.user[i];
                  return Card
                  (
                    child: ListTile
                    (
                      leading: const Icon(Icons.person),
                      title: Text(obj.title ?? '--'),
                      subtitle: Text(obj.userId.toString()),
                    ),
                  );
                }
              );
            }
            return const SizedBox();
          }
        ),
      ),
    );
  }
}