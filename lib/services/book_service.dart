import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:posfin_test/model/book.dart';

class BookService extends GetxService {
  var books = <Book>[].obs;
  final Dio _dio = Dio();

  final String baseUrl = 'http://10.0.2.2:5000/api/books';

  Future<void> fetchBooks() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        var fetchedBooks = (response.data['data'] as List)
            .map((book) => Book.fromJson(book))
            .toList();
        books.assignAll(fetchedBooks);
      } else {
        Get.snackbar(
            'Error', response.data['message'] ?? 'Failed to fetch books');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch books: $e');
    }
  }

  Future<void> addBook(Book book) async {
    try {
      final response =
          await _dio.post(baseUrl, data: book.toJson(excludeId: true));
      if (response.statusCode == 201) {
        books.add(Book.fromJson(response.data['data']));
      } else {
        Get.snackbar('Error', response.data['message'] ?? 'Failed to add book');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add book: $e');
    }
  }

  Future<void> updateBook(Book book) async {
    try {
      final response =
          await _dio.put('$baseUrl/${book.id}', data: book.toJson());
      if (response.statusCode == 200) {
        int index = books.indexWhere((b) => b.id == book.id);
        if (index != -1) {
          books[index] = Book.fromJson(response.data['data']);
        }
      } else {
        Get.snackbar(
            'Error', response.data['message'] ?? 'Failed to update book');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update book: $e');
    }
  }

  Future<void> deleteBook(String id) async {
    try {
      final response = await _dio.delete('$baseUrl/$id');
      if (response.statusCode == 200) {
        books.removeWhere((book) => book.id == id);
      } else {
        Get.snackbar(
            'Error', response.data['message'] ?? 'Failed to delete book');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete book: $e');
    }
  }
}
