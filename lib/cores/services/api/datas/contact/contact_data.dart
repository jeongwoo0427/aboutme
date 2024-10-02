import 'package:aboutme/cores/services/api/interceptors/public_auth_interceptor.dart';

import '../../api_service.dart';

class ContactData {
  Future<void> newContact({required String message, required String myContact, required String ipAddress}) async {
    final String pathString = '/v1/portfolio/contact';
    final data = await APIService().request(pathString, method: 'POST',interceptors: [PublicAuthInterceptor()], data: {
      "message": message,
      "myContact": myContact,
      "ipAddress": ipAddress
    });
  }
}
