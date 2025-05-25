class Post {
  final String title;
  final String content;
  final DateTime postAt;

  Post({
    required this.title,
    required this.content,
    DateTime? postAt, // Make postAt optional
  }) : postAt = postAt ?? DateTime.now(); // Default to current date/time

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] ?? 'No Title',
      content: json['content'] ?? '',
      postAt: json['postAt'] != null 
          ? DateTime.parse(json['postAt']) 
          : null, // Will use default if null
    );
  }
}