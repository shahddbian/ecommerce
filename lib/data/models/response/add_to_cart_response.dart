class AddCartResponse {
  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  AddDataCart? data;
  String? statusMsg;

  AddCartResponse(
      {this.status,
      this.message,
      this.numOfCartItems,
      this.cartId,
      this.data,
      this.statusMsg});

  AddCartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? new AddDataCart.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['numOfCartItems'] = this.numOfCartItems;
    data['cartId'] = this.cartId;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AddDataCart {
  String? sId;
  String? cartOwner;
  List<AddProduct>? products;
  String? createdAt;
  String? updatedAt;
  num? iV;
  num? totalCartPrice;

  AddDataCart(
      {this.sId,
      this.cartOwner,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalCartPrice});

  AddDataCart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = <AddProduct>[];
      json['products'].forEach((v) {
        products!.add(new AddProduct.fromJson(v));
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

class AddProduct {
  num? count;
  String? sId;
  String? product;
  num? price;

  AddProduct({this.count, this.sId, this.product, this.price});

  AddProduct.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['_id'] = this.sId;
    data['product'] = this.product;
    data['price'] = this.price;
    return data;
  }
}
