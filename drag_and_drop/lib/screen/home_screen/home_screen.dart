import 'package:drag_and_drop/mock_book_list.dart';
import 'package:drag_and_drop/screen/home_screen/models/book.dart';
import 'package:drag_and_drop/screen/home_screen/widgets/book_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalKey = GlobalKey();

  int itemInBasket = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              DragTarget<Book>(
                onAccept: (data) {
                  setState(() {
                    itemInBasket++;
                  });
                },
                builder: (_, targets, ___) {
                  return Icon(
                    Icons.shopping_basket,
                    size: 32.0,
                    color: targets.isNotEmpty ? Colors.red : Colors.white,
                  );
                },
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$itemInBasket',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300.0,
            child: ListView.separated(
              itemCount: mockBookList.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, __) {
                return const SizedBox(width: 10.0);
              },
              itemBuilder: (_, index) {
                return DraggableBook(
                  book: mockBookList[index],
                  globalKey: globalKey,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
