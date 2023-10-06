import 'package:http/http.dart' as http;
import 'package:own_project/features/mario/ambiio_model.dart';

class AmbiioService {
  String uri = "https://www.amiiboapi.com/api/amiibo/?name=mario";

  Future<dynamic> getBitCoinData() async {
    try {
      http.Response res = await http.get(Uri.parse(uri), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if (res.statusCode == 200) {
        return amiioModelFromJson(res.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
