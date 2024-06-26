class Album {
  String title;
  int numero;
  int year;
  int yearInColor;
  String image;
  String resume;

  Album(this.title, this.numero, this.year, this.yearInColor, this.image, this.resume);

  @override
  String toString() {
    print('Album{title: $title, numero: $numero, year: $year, yearInColor: $yearInColor, image: $image, resume: $resume}');
    return 'Album{title: $title, numero: $numero, year: $year, yearInColor: $yearInColor, image: $image, resume: $resume}';
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'numero': numero,
      'year': year,
      'yearInColor': yearInColor,
      'image': image,
      'resume': resume
    };
  }
}