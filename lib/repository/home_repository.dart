import '../model/model.dart';
import '../services/services.dart';

class HomeRepository {
  final ApiService apiService;

  HomeRepository(this.apiService);

  Future<List<Books>> getBooks(param) async {
    List<Books> books = [];

    final result = await apiService.getResponse(param) as Map<String, dynamic>?;

    if (result != null) {
      final list = result['reading_log_entries'] as List;

      books.clear();
      for (var book in list) {
        books.add(Books.fromJson(book));
      }
    }

    return books;
  }
}
