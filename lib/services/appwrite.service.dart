import 'package:flappwrite_account_kit/flappwrite_account_kit.dart' as ap;
import 'package:flappwrite_chat/models/user.dart';
import 'package:flappwrite_chat/res/constants.dart';

class AppwriteService {
  static final AppwriteService _instance = AppwriteService._internal();
  late final ap.Client _client;
  late final ap.Database _db;
  String? _error;

  factory AppwriteService() {
    return _instance;
  }

  String? get error => _error;
  ap.Client get client => _client;

  AppwriteService._internal() {
    _client = ap.Client()
        .setEndpoint('https://demo.appwrite.io/v1')
        .setProject('61330fe0b707b');
    _db = ap.Database(client);
  }

  Future<User?> saveUser({
    required String email,
    required String userId,
    String? name,
  }) async {
    try {
      final res = await _db.createDocument(
        collectionId: AppConstants.usersCollection,
        data: {
          "name": name,
          "email": email,
          "userId": userId,
        },
        read: ['*'],
        write: ['user:$userId'],
      );
      return User.fromMap(res.data);
    } on ap.AppwriteException catch (e) {
      _error = e.message;
    }
  }

  Future<List<User>> getUsers() async {
    try {
      final res =
          await _db.listDocuments(collectionId: AppConstants.usersCollection);
      return List<User>.from(
          res.data['documents'].map((doc) => User.fromMap(doc)));
    } on ap.AppwriteException catch (e) {
      _error = e.message;
      return [];
    }
  }
}

final appwrite = AppwriteService();
