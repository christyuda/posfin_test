import 'package:get/get.dart';
import 'package:posfin_test/services/book_service.dart';
import '../model/book.dart';

class BookController extends GetxController {
  final BookService bookService = Get.put(BookService());

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  void fetchBooks() async {
    await bookService.fetchBooks();
  }

  void addBook(Book book) async {
    await bookService.addBook(book);
    fetchBooks();
  }

  void updateBook(Book book) async {
    await bookService.updateBook(book);
    fetchBooks();
  }

  void deleteBook(String id) async {
    await bookService.deleteBook(id);
    fetchBooks();
  }

  List<Book> get books => bookService.books;
}
