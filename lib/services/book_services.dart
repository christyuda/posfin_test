import 'package:get/get.dart';
import 'package:posfin_test/model/book.dart';

class BookService extends GetxService {
  var books = <Book>[].obs;

  Future<void> fetchBooks() async {
    var fetchedBooks = [
      Book(id: '1', title: 'Book 1', author: 'Author 1'),
      Book(id: '2', title: 'Book 2', author: 'Author 2'),
    ];

    books.assignAll(fetchedBooks);
  }

  Future<void> addBook(Book book) async {
    books.add(book);
  }

  Future<void> updateBook(Book book) async {
    int index = books.indexWhere((b) => b.id == book.id);
    if (index != -1) {
      books[index] = book;
    }
  }

  Future<void> deleteBook(String id) async {
    books.removeWhere((book) => book.id == id);
  }
}
