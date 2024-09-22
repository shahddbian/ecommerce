class CategoreyBrandResponse {
  num? results;
  Metadata? metadata;
  List<CategoryBrand>? data;
  String? message;
  String? statusMsg;

  CategoreyBrandResponse(
      {this.results, this.metadata, this.data, this.message, this.statusMsg});

  CategoreyBrandResponse.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <CategoryBrand>[];
      json['data'].forEach((v) {
        data!.add(new CategoryBrand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.results;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  num? currentPage;
  num? numberOfPages;
  num? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['numberOfPages'] = this.numberOfPages;
    data['limit'] = this.limit;
    return data;
  }
}

class CategoryBrand {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryBrand(
      {this.sId,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});

  CategoryBrand.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
