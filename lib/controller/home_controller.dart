import 'package:book_library/app/app_constant.dart';
import 'package:book_library/app/enum.dart';
import 'package:book_library/app/extensions.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../repository/repository.dart';
import 'base_controller.dart';

class HomeController extends BaseController {
  final HomeRepository homeRepository;

  HomeController(this.homeRepository);

  RxList<Books> books = <Books>[].obs;

  RxList<Books> tempBooks = <Books>[].obs;

  @override
  void onInit() {
    fetchBookFromAPi();
    super.onInit();
  }

  toggleStatus(index) {
    if (books[index].bookStatus.value == BookStatus.read) {
      books[index].bookStatus.value = BookStatus.unread;
    } else {
      books[index].bookStatus.value = BookStatus.read;
    }
    update();
  }

  fetchBookFromAPi() async {
    appState.value = AppState.loading;
    final apiResult = await homeRepository.getBooks(AppConstant.alwaysReadBook);
    appState.value = AppState.complete;
    books.value = apiResult;
    tempBooks.addAll(books);
  }

  void onSearchResult(query) {
    books.value = filterBookSearchResults(query);
  }

  List<Books> filterBookSearchResults(String query) {
    if (query.isEmpty) {
      return tempBooks;
    }
    return tempBooks
        .where((item) =>
            item.title.orEmpty().toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
