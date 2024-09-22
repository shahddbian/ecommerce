import 'package:ecommerce/data/models/response/categories_brands_response.dart';
import 'package:ecommerce/data/models/response/products_response.dart';

class GetCartResponse {
  String? status;
  num? numOfCartItems;
  String? cartId;
  GetDataCart? data;
  String? statusMsg;
  String? message;

  GetCartResponse(
      {this.status,
      this.numOfCartItems,
      this.cartId,
      this.data,
      this.message,
      this.statusMsg});

  GetCartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? new GetDataCart.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['numOfCartItems'] = this.numOfCartItems;
    data['cartId'] = this.cartId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class GetDataCart {
  String? sId;
  String? cartOwner;
  List<GetProductCart>? products;
  String? createdAt;
  String? updatedAt;
  num? iV;
  num? totalCartPrice;

  GetDataCart(
      {this.sId,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});

  GetDataCart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <GetProductCart>[];
      json['products'].forEach((v) {
        products!.add(new GetProductCart.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['cartOwner'] = this.cartOwner;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['totalCartPrice'] = this.totalCartPrice;
    return data;
  }
}

class GetProductCart {
  num? count;
  String? sId;
  GetProduct? product;
  num? price;

  GetProductCart({this.count, this.sId, this.product, this.price});

  GetProductCart.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'] != null
        ? new GetProduct.fromJson(json['product'])
        : null;
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['_id'] = this.sId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['price'] = this.price;
    return data;
  }
}

class GetProduct {
  List<Subcategory>? subcategory;
  String? sId;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryBrand? category;
  CategoryBrand? brand;
  double? ratingsAverage;
  String? id;

  GetProduct(
      {this.subcategory,
      this.sId,
      this.title,
      this.quantity,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.id});

  GetProduct.fromJson(Map<String, dynamic> json) {
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new Subcategory.fromJson(v));
      });
    }
    sId = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? new CategoryBrand.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? new CategoryBrand.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['quantity'] = this.quantity;
    data['imageCover'] = this.imageCover;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['ratingsAverage'] = this.ratingsAverage;
    data['id'] = this.id;
    return data;
  }
}
