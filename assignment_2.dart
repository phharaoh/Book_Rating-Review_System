import 'dart:io';

void main() {
  List<Map<String, dynamic>> books = [
    {'isbn': '1001', 'title': 'The Art of War', 'rating': 8.7},
    {'isbn': '1002', 'title': 'Rich Dad Poor Dad', 'rating': 7.5},
    {'isbn': '1003', 'title': 'The Power of Positive Thinking', 'rating': 6.8}
  ];

  List<Map<String, dynamic>> reviews = [
    {
      'isbn': '1001',
      'reviewer': 'Ahmed',
      'text': 'Excellent book that changes your mindset'
    },
    {
      'isbn': '1001',
      'reviewer': 'Ali',
      'text': 'Very useful for managers and leaders'
    },
    {
      'isbn': '1002',
      'reviewer': 'Salah',
      'text': 'Provides important financial concepts'
    }
  ];

  while (true) {
    print('\n==== Book Rating and Review System ====');
    print('1. View all books');
    print('2. Add/Update a book');
    print('3. View reviews for a specific book');
    print('4. Get book recommendations');
    print('5. Exit');
    print('Enter your choice: ');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('\n=== All Books ===');
        books.forEach((book) {
          print('ISBN: ${book['isbn']}');
          print('Title: ${book['title']}');
          print('Rating: ${book['rating']}');
          print('------------------');
        });
        break;

      case '2':
        print('\n=== Add/Update Book ===');
        print('Enter book ISBN: ');
        var isbn = stdin.readLineSync();
        print('Enter book title: ');
        var title = stdin.readLineSync();
        print('Enter book rating (out of 10): ');
        var rating = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

        var existingIndex = books.indexWhere((book) => book['isbn'] == isbn);
        if (existingIndex != -1) {
          books[existingIndex] = {
            'isbn': isbn,
            'title': title,
            'rating': rating
          };
          print('Book updated successfully');
        } else {
          books.add({'isbn': isbn, 'title': title, 'rating': rating});
          print('Book added successfully');
        }
        break;

      case '3':
        print('\n=== View Book Reviews ===');
        print('Enter book ISBN: ');
        var searchIsbn = stdin.readLineSync();

        var bookReviews =
            reviews.where((r) => r['isbn'] == searchIsbn).toList();
        var book =
            books.firstWhere((b) => b['isbn'] == searchIsbn, orElse: () => {});

        if (book.isNotEmpty) {
          print('\nBook: ${book['title']}');
          print('Rating: ${book['rating']}');
          print('--- Reviews ---');

          if (bookReviews.isEmpty) {
            print('No reviews available for this book');
          } else {
            bookReviews.forEach((review) {
              print('Reviewer: ${review['reviewer']}');
              print('Review: ${review['text']}');
              print('------------------');
            });
          }
        } else {
          print('No book found with this ISBN');
        }
        break;

      case '4':
        print('\n=== Book Recommendations ===');
        for (var book in books) {
          var recommendation = getRecommendation(book['rating']);
          print('${book['title']}: $recommendation');
        }
        break;

      case '5':
        print('Thank you for using the system. Goodbye!');
        return;

      default:
        print('Invalid choice, please try again');
    }
  }
}

String getRecommendation(double rating) {
  switch (rating) {
    case < 5:
      return 'Not Recommended';
    case >= 5 && < 8:
      return 'Recommended';
    default:
      return 'Highly Recommended';
  }
}
