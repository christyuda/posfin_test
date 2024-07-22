import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posfin_test/model/book_model.dart';

class BookService extends GetxService {
  var books = <Book>[].obs;
  final Dio _dio = Dio();

  final String baseUrl = 'http://10.0.2.2:8082/books';

  Future<void> fetchBooks() async {
    try {
      final response = await _dio.get(baseUrl);
      print('Fetch response status: ${response.statusCode}');
      print('Fetch response data: ${response.data}');

      if (response.statusCode == 200) {
        var fetchedBooks = (response.data['Data'] as List)
            .map((book) => Book.fromJson(book))
            .toList();
        books.assignAll(fetchedBooks);
        print('Fetched books: $fetchedBooks');
      } else {
        Get.snackbar(
            'Error', response.data['Message'] ?? 'Failed to fetch books',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch books: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
      print('Error: $e');
    }
  }

  Future<void> addBook(Book book) async {
    try {
      final response =
          await _dio.post(baseUrl, data: book.toJson(excludeId: true));
      print('Add response status: ${response.statusCode}');
      print('Add response data: ${response.data}');

      if (response.data['StatusCode'] == 201) {
        books.add(Book.fromJson(response.data['Data']));
        Get.snackbar(
            'Success', response.data['Message'] ?? 'Book added successfully',
            backgroundColor: Colors.green, colorText: Colors.white);
        fetchBooks();
      } else {
        Get.snackbar('Error', response.data['Message'] ?? 'Failed to add book',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add book: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
      print('Error: $e');
    }
  }

  Future<void> updateBook(Book book) async {
    try {
      final response = await _dio.put('$baseUrl/${book.id}',
          data: book.toJson(excludeId: true));
      print('Update response status: ${response.statusCode}');
      print('Update response data: ${response.data}');

      if (response.data['StatusCode'] == 200) {
        int index = books.indexWhere((b) => b.id == book.id);
        if (index != -1) {
          books[index] = Book.fromJson(response.data['Data']);
        }
        Get.snackbar(
            'Success', response.data['Message'] ?? 'Book updated successfully',
            backgroundColor: Colors.green, colorText: Colors.white);
        fetchBooks();
      } else {
        Get.snackbar(
            'Error', response.data['Message'] ?? 'Failed to update book',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update book: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
      print('Error: $e');
    }
  }

  Future<void> deleteBook(String id) async {
    try {
      final response = await _dio.delete('$baseUrl/delete/$id');
      print('Delete response status: ${response.statusCode}');
      print('Delete response data: ${response.data}');

      if (response.data['StatusCode'] == 204) {
        books.removeWhere((book) => book.id == id);
        Get.snackbar(
            'Success', response.data['Message'] ?? 'Book deleted successfully',
            backgroundColor: Colors.green, colorText: Colors.white);
        fetchBooks();
      } else {
        Get.snackbar(
            'Error', response.data['Message'] ?? 'Failed to delete book',
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete book: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
      print('Error: $e');
    }
  }
}
