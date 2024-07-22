import 'package:get/get.dart';
import 'package:posfin_test/model/book.dart';
import 'package:posfin_test/services/book_services.dart';

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
  }

  void updateBook(Book book) async {
    await bookService.updateBook(book);
  }

  void deleteBook(String id) async {
    await bookService.deleteBook(id);
  }

  List<Book> get books => bookService.books;
}
