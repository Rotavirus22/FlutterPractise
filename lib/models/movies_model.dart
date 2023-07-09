class MoviesModel {
  List<MoviesData>? moviesData;

  MoviesModel({this.moviesData});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    if (json['moviesData'] != null) {
      moviesData = <MoviesData>[];
      json['moviesData'].forEach((v) {
        moviesData!.add(new MoviesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.moviesData != null) {
      data['moviesData'] = this.moviesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MoviesData {
  int? id;
  String? name;
  String? info;
  String? image;
  dynamic rating;
  MoviesData({this.id, this.name, this.info, this.image, this.rating});

  MoviesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    image = json['image'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['info'] = this.info;
    data['image'] = this.image;
    data['rating'] = this.rating;
    return data;
  }
}

