class Book {
  String id;
  String title;
  String author;

  Book({required this.id, required this.title, required this.author});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['_id'],
      title: json['title'],
      author: json['author'],
    );
  }

  Map<String, dynamic> toJson({bool excludeId = false}) {
    final data = {
      'title': title,
      'author': author,
    };

    if (!excludeId) {
      data['_id'] = id;
    }

    return data;
  }
}
