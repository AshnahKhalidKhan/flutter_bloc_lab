import 'package:flutter/material.dart';

class TestPage extends StatelessWidget 
{
  const TestPage({super.key});

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
            // return ListTile
            // (
            //   leading: Icon(Icons.person),
            //   title: Text('First Text'),
            //   subtitle: Text('Second Text'),
            // );
            return SpecialWidget();
          }
        ),
      ),
    );
  }
}

class SpecialWidget extends StatelessWidget 
{
  const SpecialWidget({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return ListTile
    (
      leading: Icon(Icons.person),
      title: Text('First Text'),
      subtitle: Text('Second Text'),
    );
  }
}

