import 'package:http/http.dart' as http;
import 'package:own_project/features/computer_games/computer_game_model.dart';

class ComputerGameService {
  String url = "https://www.cheapshark.com/api/1.0/deals?upperPrice=15";

  Future<List<ComputerGamesModel>> getComputerGames() async {
    List<ComputerGamesModel> computerGameData = [];
    try {
      http.Response res = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      if (res.statusCode == 200) {
        computerGameData = computerGamesModelFromJson(res.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return computerGameData;
  }
}
