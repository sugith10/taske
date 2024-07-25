/// Entity representing a post with an ID, title, and description.
class Task {
  final int id;
  final String title;
  final String description;

  /// Constructs a [Task] with the given [id], [title], and [description].
  Task({
    required this.id,
    required this.title,
    required this.description,
  });
}
