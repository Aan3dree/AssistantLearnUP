import '../utils/key.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  void fetchData() async {
    String authority = 'serpapi.com';
    String unencodedPath = 'search';
    final url = Uri.https(authority, unencodedPath,
        {'engine': 'google_scholar', 'q': 'alexa', 'apikey': apiKey});
    /*final url = Uri.parse(
        'https://serpapi.com/search?engine=google_scholar&q=alexa&apikey=${apiKey}');
        */
    final response = await http.get(url);
    //print(response.body);
  }
}
