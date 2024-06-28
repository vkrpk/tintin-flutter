class Album {
  String title;
  int numero;
  int year;
  int yearInColor;
  String image;
  String resume;

  Album({required this.title, required this.numero, required this.year, required this.yearInColor, required this.image, required this.resume});

  @override
  String toString() {
    print('Album{title: $title, numero: $numero, year: $year, yearInColor: $yearInColor, image: $image, resume: $resume}');
    return 'Album{title: $title, numero: $numero, year: $year, yearInColor: $yearInColor, image: $image, resume: $resume}';
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['title'],
      numero: json['numero'],
      year: json['year'],
      yearInColor: 10,
      image: 'images/${json['image']}',
      resume: json['resume'],
    );
  }

  Map<String, dynamic> toJson(list) {
    return {
      'title': title,
      'numero': numero,
      'year': year,
      'yearInColor': yearInColor,
      'image': image,
      'resume': resume
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Album &&
              runtimeType == other.runtimeType &&
              title == other.title;

  @override
  int get hashCode => title.hashCode;
}