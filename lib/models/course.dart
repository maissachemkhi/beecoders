class Course {
  final String title;
  final double price;
  final String? image;

  Course({
    required this.title,
    required this.price,
    this.image,
  });


  Course copyWith({
    String? title,
    double? price,
    String? image,
  }) {
    return Course(
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }
}
