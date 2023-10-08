import 'package:http/http.dart' as http;
import 'package:own_project/features/country/country_model.dart';

class CountryService {
  Future<List<dynamic>> checkCountry({
    required String predictionName,
  }) async {
    try {
      http.Response res = await http.get(
        Uri.parse('https://api.nationalize.io/?name=$predictionName'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //'key': apiKey,
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        return [true, countryModelFromJson(res.body)];
      } else {
        return [false];
      }
    } catch (e) {
      return [false];
    }
  }
}
