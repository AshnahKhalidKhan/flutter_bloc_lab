import 'package:flutter/material.dart';

class name extends StatelessWidget 
{
  const name({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Flutter Tests')
      ),
      body: Container
      (
        child: ListView.builder
        (
          itemCount: 5,
          itemBuilder: (context, index)
          {
            return ListTile
            (
              leading: Icon(Icons.person),
              title: Text('First Text'),
              subtitle: Text('Second Text'),
            );
          }
        ),
      ),
    );
  }
}