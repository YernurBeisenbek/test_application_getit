import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/todo/todo_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/todos")
  Future<List<TodoModel>> getTodos();
}

Dio dio = Dio();
ApiService apiService = ApiService(dio);
