import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posfin_test/controller/book_controller2.dart';
import 'book_add_view.dart';
import 'book_edit_view.dart';

class BookListView extends StatelessWidget {
  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: Obx(() {
        if (bookController.books.isEmpty) {
          return Center(child: Text('No books found'));
        }

        return ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: bookController.books.length,
          itemBuilder: (context, index) {
            final book = bookController.books[index];
            return Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                title: Text(
                  book.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                subtitle: Text(
                  book.author,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Get.to(() => BookEditView(book: book));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        bookController.deleteBook(book.id);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => BookAddView());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
