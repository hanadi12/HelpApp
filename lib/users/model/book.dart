class Book {
  int? id;
  String typebook;
  String bookimage;

  Book(this.id, this.typebook, this.bookimage);

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        int.parse(json["id"]),
        json["typebook"],
        json["bookimage"],
      );

  Map<String, dynamic> toJson() => {
        'id': this.id.toString(),
        'name': this.typebook,
        'email': this.bookimage,
      };
}
