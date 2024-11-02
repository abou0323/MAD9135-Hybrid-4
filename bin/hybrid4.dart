import 'package:hybrid4/hybrid4.dart' as hybrid4;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    const url = "https://random-data-api.com/api/v2/users?size=";
    const size = "10";
    var uri = Uri.parse(url + size);

    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      var data =
          List<Map<String, dynamic>>.from(jsonResponse); // List of Map objects

      for (var user in data) {
        var firstName = user["first_name"];
        var lastName = user["last_name"];
        var uid = user["uid"];
        var userDetails = "uid: $uid, \t Full Name: $firstName $lastName";
        print(userDetails);
      }
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  } catch (err) {
    print("Failed to fetch. Error: $err");
  }
}
