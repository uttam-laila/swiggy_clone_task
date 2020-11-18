import 'package:http/http.dart' as http;

Future<String> getDishes() async {
  var url = 'https://api.mocki.io/v1/b6d75326';

  var response = await http.get(url);
  if (response.statusCode == 200) {
    return (response.body);
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}
