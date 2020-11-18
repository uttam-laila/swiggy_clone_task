import 'package:http/http.dart' as http;

Future<String> getRestaurent() async {
  var url = 'https://api.mocki.io/v1/c0140ab0';

  var response = await http.get(url);
  if (response.statusCode == 200) {
    return (response.body);
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}
