import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(LibraryApp());

class LibraryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Thư Viện iOS',
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: LibraryHomePage(),
    );
  }
}

class LibraryHomePage extends StatefulWidget {
  @override
  _LibraryHomePageState createState() => _LibraryHomePageState();
}

class _LibraryHomePageState extends State<LibraryHomePage> {
  int _currentIndex = 0;

  // Shared books list between pages
  List<Book> books = [
    Book('Sách A', 'Tác giả A', 2020, false, ''),
    Book('Sách B', 'Tác giả B', 2018, true, 'Nguyễn Văn A'),
    Book('Sách C', 'Tác giả C', 2021, false, ''),
  ];

  // Shared user list between pages
  List<String> users = ['Nguyễn Văn A', 'Trần Văn B', 'Lê Thị C'];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.gear), label: 'Quản lý'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), label: 'DS Sách'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: 'Người dùng'),
        ],
      ),
      tabBuilder: (context, index) {
        final pages = [
          ManagementPage(books: books, users: users),
          BookListPage(books: books),
          UserListPage(users: users),
        ];
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(['Quản lý', 'DS Sách', 'Người dùng'][index]),
          ),
          child: pages[index],
        );
      },
    );
  }
}

class ManagementPage extends StatefulWidget {
  final List<Book> books;
  final List<String> users;

  const ManagementPage({required this.books, required this.users});

  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  String staffName = "Nguyễn Văn A";

  void _addBook() {
    if (_titleController.text.isNotEmpty &&
        _authorController.text.isNotEmpty &&
        _yearController.text.isNotEmpty) {
      setState(() {
        widget.books.add(Book(
          _titleController.text,
          _authorController.text,
          int.tryParse(_yearController.text) ?? 0,
          false,
          '',
        ));
        _titleController.clear();
        _authorController.clear();
        _yearController.clear();
      });
    }
  }

  void _borrowBook(Book book) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('Chọn người dùng để mượn sách'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.users.map((user) {
              return CupertinoButton(
                child: Text(user),
                onPressed: () {
                  setState(() {
                    book.isBorrowed = true;
                    book.borrowedBy = user;
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _returnBook(Book book) {
    setState(() {
      book.isBorrowed = false;
      book.borrowedBy = '';
    });
  }

  void _changeStaffName() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        TextEditingController controller = TextEditingController();
        return CupertinoAlertDialog(
          title: Text('Đổi Tên Nhân Viên'),
          content: CupertinoTextField(
            controller: controller,
            placeholder: 'Nhập tên nhân viên mới',
          ),
          actions: [
            CupertinoDialogAction(
              child: Text('Hủy'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              child: Text('Lưu'),
              onPressed: () {
                setState(() {
                  if (controller.text.isNotEmpty) {
                    staffName = controller.text;
                  }
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nhân viên: $staffName', style: CupertinoTheme.of(context).textTheme.textStyle),
            CupertinoButton.filled(
              child: Text('Đổi Tên Nhân Viên'),
              onPressed: _changeStaffName,
            ),
            SizedBox(height: 32),
            CupertinoTextField(
              controller: _titleController,
              placeholder: 'Tên sách',
            ),
            SizedBox(height: 8),
            CupertinoTextField(
              controller: _authorController,
              placeholder: 'Tác giả',
            ),
            SizedBox(height: 8),
            CupertinoTextField(
              controller: _yearController,
              placeholder: 'Năm xuất bản',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            CupertinoButton.filled(
              child: Text('Thêm Sách'),
              onPressed: _addBook,
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.books.length,
              itemBuilder: (context, index) {
                final book = widget.books[index];
                return CupertinoListTile(
                  title: Text(book.title),
                  subtitle: Text(
                      'Tác giả: ${book.author} | Năm: ${book.year} | ${book.isBorrowed ? "Mượn bởi: ${book.borrowedBy}" : "Có sẵn"}'),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      book.isBorrowed ? 'Trả' : 'Mượn',
                      style: TextStyle(
                        color: book.isBorrowed
                            ? CupertinoColors.systemRed
                            : CupertinoColors.activeGreen,
                      ),
                    ),
                    onPressed: () =>
                        book.isBorrowed ? _returnBook(book) : _borrowBook(book),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BookListPage extends StatelessWidget {
  final List<Book> books;

  const BookListPage({required this.books});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return CupertinoListTile(
          title: Text(book.title),
          subtitle: Text(
              'Tác giả: ${book.author} | Năm: ${book.year} | ${book.isBorrowed ? "Mượn bởi: ${book.borrowedBy}" : "Có sẵn"}'),
        );
      },
    );
  }
}

class UserListPage extends StatefulWidget {
  final List<String> users;

  const UserListPage({required this.users});

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final TextEditingController _userController = TextEditingController();

  void _addUser() {
    if (_userController.text.isNotEmpty) {
      setState(() {
        widget.users.add(_userController.text);
        _userController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16), // Lùi phần hiển thị xuống một chút cho cân đối
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: CupertinoTextField(
                  controller: _userController,
                  placeholder: 'Nhập tên người dùng mới',
                ),
              ),
              CupertinoButton.filled(
                child: Text('Thêm'),
                onPressed: _addUser,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.users.length,
            itemBuilder: (context, index) {
              return CupertinoListTile(
                title: Text(widget.users[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Book {
  final String title;
  final String author;
  final int year;
  bool isBorrowed;
  String borrowedBy;

  Book(this.title, this.author, this.year, this.isBorrowed, this.borrowedBy);
}
