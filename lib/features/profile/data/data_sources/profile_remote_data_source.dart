abstract class ProfileRemoteDataSource {
  Future<Map<String, dynamic>> getUserData();
  Future<void> updateProfile(Map<String, dynamic> data);
  Future<void> deleteAccount();
}