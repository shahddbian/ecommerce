import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/api/endpoints.dart';
import 'package:ecommerce/data/models/faliuer.dart';
import 'package:ecommerce/data/models/request/login_requsest.dart';
import 'package:ecommerce/data/models/request/register_request.dart';
import 'package:ecommerce/data/models/response/AddToWishListResponse.dart';
import 'package:ecommerce/data/models/response/GetWishListResponse.dart';
import 'package:ecommerce/data/models/response/LoginResponse.dart';
import 'package:ecommerce/data/models/response/add_to_cart_response.dart';
import 'package:ecommerce/data/models/response/categories_brands_response.dart';
import 'package:ecommerce/data/models/response/get_cart_response.dart';
import 'package:ecommerce/data/models/response/products_response.dart';
import 'package:ecommerce/data/models/response/register_response.dart';
import 'package:ecommerce/ui/utils/sharedpreferences.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static const String baseUrl = 'ecommerce.routemisr.com';
  static const String userToken = 'user_token';

  static Future<RegisterResponse> register(String name, String email,
      String password, String phone, String rePassword) async {
    Uri url = Uri.https(baseUrl, EndPoints.signUp);
    var registerRequest = RegisterRequest(
        name: name,
        email: email,
        password: password,
        phone: phone,
        rePassword: rePassword);
    try {
      var response = await http.post(url, body: registerRequest.toJson());
      return _handleResponse<RegisterResponse>(response);
    } catch (e) {
      throw e;
    }
  }

  static Future<LoginResponse> login(String email, String password) async {
    Uri url = Uri.https(baseUrl, EndPoints.login);
    var loginRequest = LoginRequest(email: email, password: password);
    try {
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse = _handleResponse<LoginResponse>(response);
      mySharedPreferences.saveData(key: 'token', value: loginResponse.token);
      return loginResponse;
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoreyBrandResponse> getAllCategories() async {
    Uri url = Uri.https(baseUrl, EndPoints.getAllCategories);
    var response = await http.get(url);
    return _handleResponse<CategoreyBrandResponse>(response);
  }

  static Future<CategoreyBrandResponse> getAllBrands() async {
    Uri url = Uri.https(baseUrl, EndPoints.getAllBrands);
    var response = await http.get(url);
    return _handleResponse<CategoreyBrandResponse>(response);
  }

  static Future<ProductResponse> getAllProducts() async {
    Uri url = Uri.https(baseUrl, EndPoints.getAllProducts);
    var response = await http.get(url);
    return _handleResponse<ProductResponse>(response);
  }

  static Future<Either<Failures, AddCartResponse>> addToCart(
      String productId) async {
    Uri url = Uri.https(baseUrl, EndPoints.addToCart);
    try {
      var token = mySharedPreferences.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      return _handleResponseEither<AddCartResponse>(response);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetCartResponse>> getCart() async {
    Uri url = Uri.https(baseUrl, EndPoints.getCart);
    try {
      var token = mySharedPreferences.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      return _handleResponseEither<GetCartResponse>(response);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetCartResponse>> deleteItemInCart(
      String productId) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.addToCart}/$productId');
    try {
      var token = mySharedPreferences.getData(key: 'token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      return _handleResponseEither<GetCartResponse>(response);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetCartResponse>> updateCountInCart(
      String productId, int count) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.addToCart}/$productId');
    try {
      var token = mySharedPreferences.getData(key: 'token');
      var response = await http.put(url,
          headers: {'token': token.toString()}, body: {'count': '$count'});
      return _handleResponseEither<GetCartResponse>(response);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetWishlistResponse>> getWishList() async {
    Uri url = Uri.https(baseUrl, EndPoints.getWishList);
    try {
      var token = mySharedPreferences.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      return _handleResponseEither<GetWishlistResponse>(response);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, AddToWishlistResponse>> addItemToWishList(
      String productId) async {
    Uri url = Uri.https(baseUrl, EndPoints.addToWishList);
    try {
      var token = mySharedPreferences.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      return _handleResponseEither<AddToWishlistResponse>(response);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetWishlistResponse>> deleteItemFromWishList(
      String productId) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.addToWishList}/$productId');
    try {
      var token = mySharedPreferences.getData(key: 'token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      return _handleResponseEither<GetWishlistResponse>(response);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static T _handleResponse<T>(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = jsonDecode(response.body);
      return _fromJson<T>(json);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  static Either<Failures, T> _handleResponseEither<T>(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = jsonDecode(response.body);
      var data = _fromJson<T>(json);
      return Right(data);
    } else {
      var errorResponse = jsonDecode(response.body);
      return Left(ServerError(errorMessage: errorResponse['message']));
    }
  }

  static T _fromJson<T>(Map<String, dynamic> json) {
    if (T == RegisterResponse) return RegisterResponse.fromJson(json) as T;
    if (T == LoginResponse) return LoginResponse.fromJson(json) as T;
    if (T == CategoreyBrandResponse)
      return CategoreyBrandResponse.fromJson(json) as T;
    if (T == ProductResponse) return ProductResponse.fromJson(json) as T;
    if (T == AddCartResponse) return AddCartResponse.fromJson(json) as T;
    if (T == GetCartResponse) return GetCartResponse.fromJson(json) as T;
    if (T == GetWishlistResponse)
      return GetWishlistResponse.fromJson(json) as T;
    if (T == AddToWishlistResponse)
      return AddToWishlistResponse.fromJson(json) as T;
    throw Exception('Invalid type for JSON deserialization');
  }
}
