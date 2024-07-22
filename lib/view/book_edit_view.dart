import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posfin_test/controller/book_controller.dart';
import 'package:posfin_test/model/book.dart';

class BookEditView extends StatelessWidget {
  final BookController bookController = Get.find();
  final Book book;

  BookEditView({required this.book});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = book.title;
    authorController.text = book.author;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Book'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: authorController,
              decoration: InputDecoration(
                labelText: 'Author',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final title = titleController.text;
                  final author = authorController.text;

                  if (title.isNotEmpty && author.isNotEmpty) {
                    final updatedBook = Book(
                      id: book.id,
                      title: title,
                      author: author,
                    );
                    bookController.updateBook(updatedBook);
                    Get.back();
                  }
                },
                child: Text('Update Book'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  textStyle: TextStyle(fontSize: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
