class MovieListModel {
  int? rank;
  String? title;
  String? description;
  String? image;
  String? bigImage;
  List<String>? genre;
  String? thumbnail;
  String? rating;
  String? id;
  int? year;
  String? imdbid;
  String? imdbLink;

  MovieListModel(
      {this.rank,
      this.title,
      this.description,
      this.image,
      this.bigImage,
      this.genre,
      this.thumbnail,
      this.rating,
      this.id,
      this.year,
      this.imdbid,
      this.imdbLink});

  MovieListModel.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    bigImage = json['big_image'];
    genre = json['genre']?.cast<String>();
    thumbnail = json['thumbnail'];
    rating = json['rating'];
    id = json['id'];
    year = json['year'];
    imdbid = json['imdbid'];
    imdbLink = json['imdb_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['big_image'] = this.bigImage;
    data['genre'] = this.genre;
    data['thumbnail'] = this.thumbnail;
    data['rating'] = this.rating;
    data['id'] = this.id;
    data['year'] = this.year;
    data['imdbid'] = this.imdbid;
    data['imdb_link'] = this.imdbLink;
    return data;
  }

  static List<MovieListModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MovieListModel.fromJson(json)).toList();
  }
}
