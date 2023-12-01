import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lab/bloc/user_bloc.dart';
import 'package:flutter_bloc_lab/bloc/user_events.dart';
import 'package:flutter_bloc_lab/bloc/user_states.dart';
import 'package:flutter_bloc_lab/core/repository/user_repo.dart';

class ChallengePage extends StatefulWidget 
{
  final UserRepository userRepository; //
  const ChallengePage({Key? key, required this.userRepository}) : super(key: key); //

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> 
{
  late UserBloc _userBloc;

  @override
  void initState() 
  {
    super.initState();
    _userBloc = UserBloc(userRepository: widget.userRepository);
    _userBloc.add(const FetchProducts());
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.white,
        title: Text('Products', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      body: Padding
      (
        padding: EdgeInsets.all(5.0),
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
                itemBuilder: (context, i)
                {
                  var obj = state.user[i];
                  return Card
                  (
                    color: Colors.white60,
                    shape: RoundedRectangleBorder
                    (
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    
                    child: Column
                    (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: 
                      [
                        Expanded
                        (
                          child: Container
                          (
                            alignment: Alignment.topCenter,
                            width: double.infinity,
                            // height: double.minPositive,
                            height: 50,
                            decoration: BoxDecoration
                            (
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Image.network
                            (
                              obj.thumbnail.toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding
                        (
                          padding: EdgeInsets.only(left:10.0, right: 10.0),
                          child:
                          Row
                          (
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: 
                            [
                              Text(obj.title.length > 20 ? '${obj.title.substring(0, 20)}...' : obj.title, style: TextStyle(fontWeight: FontWeight.bold)),
                              Row
                              (
                                children: 
                                [
                                  Text(obj.price.toString() + " USD", style: TextStyle(fontWeight: FontWeight.bold)),
                                  IconButton
                                  (
                                    icon: Icon(Icons.remove_red_eye_sharp),
                                    onPressed: ()
                                    {
                                      showModalBottomSheet<void>
                                      (
                                      
                                        shape: RoundedRectangleBorder
                                        (
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                        ),
                                        constraints: BoxConstraints
                                        (
                                          // minWidth: double.infinity,
                                        ),
                                        // isScrollControlled: true,
                                        context: context,
                                        builder: (BuildContext context)
                                        {
                                          return Column
                                          (
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: 
                                            [
                                              Container
                                              (
                                                margin: const EdgeInsets.symmetric(vertical: 20),
                                                height: 150,
                                                child: ListView
                                                (
                                                  scrollDirection: Axis.horizontal,
                                                  children: obj.images != null && obj.images.isNotEmpty ? obj.images.map((imageInList)
                                                  {
                                                    return Card
                                                    (
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
                                                      child: Container
                                                      (
                                                        decoration: BoxDecoration
                                                        (
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        ),
                                                        child: Image.network(imageInList, fit: BoxFit.fitHeight, width: 150),
                                                      ),
                                                    );
                                                    // return Image.network(imageInList);
                                                  }).toList() : <Widget>[],
                                                ),
                                              ),
                                              ListTile
                                              (
                                                title: Text(obj.title,style: TextStyle(fontWeight: FontWeight.bold)),
                                                subtitle: Text(obj.description.toString()),
                                              ),
                                              ListTile
                                              (
                                                title: Text("\$" + obj.price.toString(),style: TextStyle(fontWeight: FontWeight.bold)),
                                              ),
                                              ListTile
                                              (
                                                title: Row
                                                (
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: 
                                                  [
                                                    Row
                                                    (
                                                      children: 
                                                      [
                                                        Icon(Icons.star, color: Colors.yellow,),
                                                        Text(obj.rating.toString(),),   
                                                      ],  
                                                    ),
                                                    Row
                                                    (
                                                      children: 
                                                      [
                                                        Text(obj.discountPercentage.toString() + "%", textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold)),
                                                        Icon(Icons.discount, color: Colors.blue,), 
                                                      ],  
                                                    ),
                                                  ]
                                                ),
                                              ),
                                            ]
                                          );
                                        }
                                      );
                                    },
                                  ),   
                                ],  
                              ),
                            ]
                          ),
                        ),
                        Padding
                        (
                          padding: EdgeInsets.only(left:10.0, right: 10.0, bottom: 10.0),
                          child:
                        Text(obj.description.toString()),
                        ),
                      ],
                    ),
                    // ),
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