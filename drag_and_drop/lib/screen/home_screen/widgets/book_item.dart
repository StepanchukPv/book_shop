import 'package:flutter/material.dart';

import '../models/book.dart';

class DraggableBook extends StatelessWidget {
  const DraggableBook({
    super.key,
    required this.globalKey,
    required this.book,
  });

  final GlobalKey globalKey;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<Book>(
      data: book,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: DraggingListItem(book: book),
      child: BookItem(book: book),
    );
  }
}

class BookItem extends StatelessWidget {
  const BookItem({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(book.imageUrl),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(book.title),
        ],
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: key,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 200,
          child: Opacity(
            opacity: 0.85,
            child: Image.network(
              book.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
