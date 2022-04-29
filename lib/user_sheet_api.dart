import 'package:gsheets/gsheets.dart';
import 'user.dart';

class UserssheetApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "marks-348705",
  "private_key_id": "b44c0ee04713e4d96694e84035a410c6a332a381",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCsGkiob6nUiJKI\nL7MF1vh+HRIFjAlSXVkWRGnfp+Xr/wWryx6FfwGIXdq5yxFfHqGuL9JPYI5bgiiv\nOt4prayicn2qfMvH0F48lw6VCZqYc2czmNIW5wgy3/JXrC3h2m2GyCbV3XB1p/Aq\nrb128i2hfxSPEqNcDUX3x5wPHm7MdtcU2Dkd1prct7qg63SzKt4xXpRSpGH7+b/I\nHj1s2FwP7zHvxwq6rmXOhfBVNTt5YT3zyjjGmYfMuxc4ikt1e88FRaMmw6L8JOOc\nbUIGYUIeZk5saDWmB5xcvdpYJDAXy1I7N8F/jdsXY4TB8eOETYLJNZrYSLMb+d+z\n/o/m1CrHAgMBAAECggEABxQXq/HXytmJKVfI5bMXSlyYuqitU3lqahuLPTszHjdB\nfPTgPv5fykON9PlQsBha7wahgElI4aOjV720mIM/p/jMiWATo5bC4XwXCfM4rA+H\nDZy5+14qPKlwVsHKq1DoE1SVIFO4xeYP3zmBIuzICq3m4xGRrX4QRCYuGYMXbIpf\nfSROyYoLjFdAzf5Y7jige2Thsok7MSqJnAW3PcAgECgCON4V8kYkTUN3FH1Axtbf\nfpecrVmKymMoeShn+OMZ6Mr/qb6B4V/qesKkScoJwajTQ+o3tm6mHLmmQfGhoZI9\nN6UUFXOEhcKphMSLpwrC7SOdfB8NYmqIj68drWw8TQKBgQDYMZfMK6GKS6Uxh0zo\n4e5UuLZDcoL2RCWzQ9VaSDT2GVzn12nxySeluQEIacVJDVm/LBjhnp7kfY0exWOj\n0mkHRUfTUt/B5FUY8/jeeIpHtKpifM5uIKKjZ10EQMOznwQ95U3qX5OAhf/7tecW\n8ULoKcW0OcwuKnjNBgbVOpadGwKBgQDLym990YFFtwh0X1zU/NLcMN7qsTh6QjrU\nwwfyuM8ahx0aqvkPmhhiZu7pKJ2muDsg/1Y8VHQADqZ1BkaZ1oq0AW/Iolhyab7O\nJ8ErhsffhFGbO8VP+7JS6PWdAO0iXtzA3YHGjJ4XBAD5aCj17UYntvyLU9WCMTED\nRfSPjSUfxQKBgG0JDhMGClHydt007OAjWo1WH26C6XQEyLLRyl/fPP7Fqeqv5Rnx\nptJZLSEuHzcJybK2LdJUqrR4cd0MFoXAEAJ/uYrmKD3kx9pu6ZxiVPN3Ndu4MHCw\nevZIokwL0efckkoZRSOokn7mlkU/583VXjYzIygTYlwCRay5lmaiRuXzAoGAPNto\nLgeJdjsxgCcWPth9U5oYh7eCqSfsD6tqTTaZSk+9BkC2fc1DqOcaQ3CIm8f6iGEX\n7I4/0eCOHvZP0RL7esPPEPhCN3CStVez3P6z43DNOfFAfCEq4I2HA2rKZfA0Njgv\n0A4gC7l7XP+Y88/2mleP1T+ky+tKurKCVPgOdQ0CgYBYbd8UYnhYA59h0rJIzleM\nd5dkWx4jSfqhIqGfNW5UDXJy/sIZz9D5h9HDOgZgSrCW0XWNDtSWjGRwGQBuZ2Wl\nyuUZGv2RtTeY3g+QP78wiiCr3hG1r7eknS4TU2rlKhz4GzpGOzZwOmneUfWjGY5K\nTT/Td0f8V6b0ZhNK5P4jrg==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets2@marks-348705.iam.gserviceaccount.com",
  "client_id": "106323908394686283893",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets2%40marks-348705.iam.gserviceaccount.com"
}
  ''';

  //   {
//   "type": "service_account",
//   "project_id": "gsheets-348506",
//   "private_key_id": "7d5d623ff05573b2aedb100deb37999d47419c4b",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQD2CNfmyr5pB+ZN\ne3JjQR9NFbK1owJUuyL6MvEuF1YEiBLdgyw/SBfwO+niMGYG/L51sA+/Ba6uI/ai\nvyvSp9DA8YVgK4Jnf6o08+apw3iYTU/TqY1QLyYu22Ia3ZeuvJgVVqgwdBfdGbTs\nXh4jPeyjJRc8lPUsvyS/SUTeOIFkCrnGmaF+FRYC58tsZy3sTuZjGlD0rcXrFAar\nN9XrW7gk9Lbco9OuYsNb3/fm+TNABk0pI58fAmEFLZH9uZSuuIvvfjkY3gTanKpq\n0qBUneziEXLY1X1mmthlVHvLLEMlDQ/fhlyFJPke5eZHiueWGSCHQJO/FtbDrOv4\nQa+hulFjAgMBAAECggEADfGHXDQ+S/vfdfcFObx4QSlLJQHK1obP3yfMRQVGjIrd\nAtfLG1UDIkwgSlTdhg+EiG1EydnRF1vAv7gfjC3oO0m/eilNF9TY48JfiVx4yleL\nVXQPpwKHt/Jv92olOAkb12MUtMDyP0dp2lbP1MXO0kTTsc0WrgVb2ElskT7Y5RSd\na1l9ykrv04hC3PaI9cctFD9wU1bThaR+kbp+ehLRy93zLTFY+jN1TvDfO3ZjOVPh\nxdctlgrJOIaGptLPfuw17v6eRG2tn+J3P54CUf2DYJSdJexrFGOKowBkKDRt3e0T\n9tpMvjJ3wbex8ClRyDiiIdcIUWqbN40Qe4DvhNjXXQKBgQD70h/l1abeyDafw7ZZ\n1JdN+x5yZFAq7OCSCdaa+v2EbfmEbnwl08WxOMvb12eXP4x0bomgKZSljq7nXSbf\nCwT9u2i1twARR64eWRCdfaqrTWHJ821qDfEvaKzWZTAIeabtOkzUfMEVNMpVZWlA\nZpytF0oRQO0U8pQucEPCDLSH/wKBgQD6HiKxmSXe1bABiqhm5Lbta1ZFdjKykUxD\n/P0XMk8dyJ7hS58sHyoIraEBAe+w5+WU1Wq33rzxmu2CVtwvUoz0q3KUKZH9/SOz\nzI/lLcjacGusE1onBryW/pU1iZoqoaNq31Vh0FzFbNy9xmrPRjPtvFIfn35jXecx\nN7YJlK0WnQKBgQCZOWjJS3Am3IJIQijBjhamj2ceSaVyCQI4Oh5H3PLHUrdhemy2\nA56l0B5S3UWeBT/sVJoPR124QxJvmwGc87KMxSzYbMpwuUHcG2t9uMpRQ1t+K01n\nG6ampzWLmrRYY9VLQY8gN+ywf5eh0HvzgLxSofoid3QKq/O4Mf04pMxwdwKBgQCX\nd3h7JMuSTsXvqRCifw9oaAAuwI2jJeqRobuDOKxA1SWiOjGCfrzt1HgULCADeevG\nXhfqkbDKf5AlxoRBBDToVotkvmfy8EGWuOLLXxarcjlCU9XcnG/I4RNrAJGkD47v\nQaBrQ8tqo6pqIqa8Lz9zUQBKtkPL2SoQ3DQZSTgo4QKBgQDBaxAaDW5nlQgKojGH\nn+BIU5VY3cXGytm9U1Xky+RW/LADT/tJeQ9RHh+mDgidYyaXzcFYOi3zmxm68jO1\nvdb/h0ruhAuwZDra5RHa9zRgdH4tEuOayw6e+5pg2eEHJFrvq4Jsm6k33iRclKw3\n1T/VfPd4pY2yjTtdlETNcOQvTw==\n-----END PRIVATE KEY-----\n",
//   "client_email": "gsheets@gsheets-348506.iam.gserviceaccount.com",
//   "client_id": "108058659095328094189",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-348506.iam.gserviceaccount.com"
// }
  static const _spreadsheetid = '1CI8V_TF8_nE9VGYy4BPRUEi5iVU-03bybb143-ln3QU';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetid);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Users');

      final firstrow = Userfields.getfields();
      _userSheet!.values.insertRow(1, firstrow);
    } catch (e) {
      print('initerror :$e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future<int> getRowCount() async {
    if (_userSheet == null) return 0;

    final lastRow = await _userSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future<List<User>> getAll() async {
    if (_userSheet == null) return <User>[];
    final users = await _userSheet!.values.map.allRows();
    return users == null ? <User>[] : users.map(User.fromJson).toList();
  }

  static Future<User?> getById(int id) async {
    if (_userSheet == null) return null;
    final json = await _userSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : User.fromJson(json);
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    _userSheet!.values.map.appendRows(rowList);
  }

  static Future<bool> update(
    int id,
    Map<String, dynamic> user,
  ) async {
    if (_userSheet == null) return false;

    return _userSheet!.values.map.insertRowByKey(id, user);
  }
}
