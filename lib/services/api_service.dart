abstract class ApiService {
  final String baseUrl = "https://openlibrary.org/";

  Future<dynamic> getResponse(String param);
}
