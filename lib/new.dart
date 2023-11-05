import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Hoo(),
    );
  }
}

class Hoo extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State <Hoo> {
  final credentials = r'''{
  "type": "service_account",
  "project_id": "food-ape-404020",
  "private_key_id": "146b811c56fa446fc35c0c10b896b28e87cff1e8",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC+Mpcsu8UAQlZQ\nBdUIxyDO5WeHNG+TobyL5f/lxywTvFYTn2fIkmBI852u4nP3aaJolhkIpFueOnxv\ndOBVY3zj95gLHtZPJzr/7Fe9jzf2q5hHOdokix7S8wF2rpSriV1Tl5pq1IkOHXlQ\nPZJcGf5sdZiICwxJUAqgJswJo9fhyEyKf+GkSl0N1kbs2E2+exDi0mQKPdMLCen7\nyRtQecBHjxZLYdXX7Cr7xLGva2LRJEucR9rpNReFT3A7to2Yk7dPbB63/gI4/2ck\nQ2bZ+MR9ToWcGO4SgjYWyx9j6FcemRTTgbX6w6DGFV5urHsJLzRaqcp2WhQAMuYT\nis7JS1SDAgMBAAECggEAIPbGsbeXdKyKphLkscFFY+Zpk4rYfbdN5NdHiy0CbCc7\nqen6RE5uRqaGYT2ZSLuzrLm6+/70bA+J6o1Qpiv4hNAwN1kwXoaXmKx/Jnjwg52I\n5mtV7fh4rqn0SnwGg1Zq6OaBGlvcpygfkvMg7zqIGIcnGQkFJ52qQciHm3Ico+JU\nkGgnI/G8Zbhjhg59EukZr+kwaf70TPP3+m4y0TSmc1cesR3fALJl9SCph4gbxQ+v\naJc/jiEda3QV+tVCRiuGpjMg6oBkOMt/G9vmt+zkFe6EsRyrigge1zjqpFFdphRk\n2+P5yKt6Jow5PHA+YYXwa1c4QGF8OsQj/XfnXNl4nQKBgQD7jp5Wrn570jbGZxbI\nbByKS1xH8Mcpdc1qkQYcJo0XMsU9ZcWHwo7PzS14gmODS+zdKAo59tJxo4Hm72SC\nysvc5tg7ZrsIzsmN72tOAQDQtoGkL+FWI1KQfiRXi9cq8B7arALjVOyYJc22SkKr\n4ya7G458/rrX+PzSHmtF+RPB5wKBgQDBjosbmMXX2MOdLldfzyjFHMFHT/D4cjeY\n4zDGUDeyphz0wpLTNCdw/LMiIzN0hxxaPgtMMdlbAjZxGu8V+//up2tOKwTGbebU\n7WueeBXwZltoxdrKAnbE3Dzarj9PGw9Rk4kyn5dMvGYtqoQXv9OT6gWYpCEtCNwF\nVst4hhe9BQKBgBU/1uA7nTOYbkgULTiA6WhFNWZeUHSQHuoBliKKnyB2iXLGRglR\nxf6Htm+XlBBjOX71AugikWRIC5EWZ8ckmlPurBVYeDQmQ6BZuRa9vvPidtEHumEs\nWq0Z+rfqeCKIZhLStOu/IL05dEcRvtAGQB9OFJs6aU4VGkYli6o9gA3BAoGAOz0/\nQhD97FQBeqfmQgKLPdjRJtxGqiN69KYEFY4Tne/NSPQML+v0blZJFRek9fMsMEpw\n9r8DASGqO++8YQQhjo9a/i+YZIrabSzFFVk3jb4mF+kGT3F1nEazsVJHOhTUGWmI\nQiAqFGhM9YkMqKAjR1AGqnMBXGErxc6Ms7SGq2kCgYBTw4ENEbOdng8lcxVCMNYW\nXpnCF8xyP4IcJxDpZscAk1AyV+PUnEZzk+ait16SxtgXiq98+JcE2E0g6JRsJ23Z\nqlf1515AJF7VPnkkhfvovneehEsFomfuMn4oMEs+a9bFojQhy037T+Ifvc1wCIKw\nmwFhzNUhtTMUsBf2CVwtxQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "food-ape@food-ape-404020.iam.gserviceaccount.com",
  "client_id": "109342418297392484215",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/food-ape%40food-ape-404020.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}''';

  List<List<String>> sheetData = [];

    @override
  void initState() {
    super.initState();

    final gsheets = GSheets(credentials);
    final spreadsheet = gsheets.spreadsheet('1ZBca-NZ5V_N0NwJ5t5Y5dpb5XFCZqRQYAXddU77M07U');

    // Fetch data from the Google Sheet and update the 'sheetData' list
    // spreadsheet.values.map.rowByKey('Sheet1').then((value) {
    //   setState(() {
    //     sheetData = value;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sheets Data in Flutter'),
      ),
      body: sheetData.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show a loading indicator
          : ListView.builder(
              itemCount: sheetData.length,
              itemBuilder: (context, index) {
                final rowData = sheetData[index];
                return ListTile(
                  title: Text(rowData[0]), // Display the first column value
                  subtitle: Text(rowData[1]), // Display the second column value
                );
              },
            ),
    );
  }
}
