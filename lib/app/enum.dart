enum AppState { initial, loading, complete }

enum BookStatus {
  read('Read'),
  unread('Unread');

  const BookStatus(this.status);

  final String status;
}
