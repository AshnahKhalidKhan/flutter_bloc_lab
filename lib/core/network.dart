import 'dart:convert';
import 'package:flutter_bloc_lab/model/product_model.dart';
import 'package:flutter_bloc_lab/model/user_model.dart';
import 'package:http/http.dart' as http;

class Endpoints 
{
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String userUrl = '$baseUrl/todos';
}

class UserApiClient 
{
  final http.Client httpClient;

  UserApiClient
  (
    {
      required this.httpClient
    }
  );

  Future<List<User>> fetchuser() async 
  {
    final userResponse = await httpClient.get(Uri.parse(Endpoints.userUrl));

    if (userResponse.statusCode != 200) 
    {
      throw Exception('Error');
    }
    List<dynamic> parsedListJson = jsonDecode(userResponse.body);

    List<User> itemsList = List<User>.from
    (
      parsedListJson.map<User>((dynamic i) => User.fromJson(i))
    );
    return itemsList;
  }

  // Future<List<Products>> fetchproducts() async 
  // {
  //   final userResponse = await httpClient.get(Uri.parse('https://dummyjson.com/products'));

  //   if (userResponse.statusCode != 200) 
  //   {
  //     throw Exception('Error');
  //   }
  //   List<dynamic> parsedListJson = jsonDecode(userResponse.body)['products'];

  //   List<Products> itemsList = List<Products>.from
  //   (
  //     parsedListJson.map<Products>((dynamic i) => Products.fromJson(i))
  //   );
  //   return itemsList;
  // }
}