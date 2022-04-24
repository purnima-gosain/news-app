import 'package:newsapp/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPost() async {
    var client = http.Client();

    var uri = Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=d394960d6d364a9eacb07e25ed5d5e76");

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      postFromJson(json);
    }
  }
}
