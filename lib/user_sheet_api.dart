import 'package:gsheets/gsheets.dart';
import 'user.dart';

class UserssheetApi {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "gsheets-348506",
  "private_key_id": "7d5d623ff05573b2aedb100deb37999d47419c4b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQD2CNfmyr5pB+ZN\ne3JjQR9NFbK1owJUuyL6MvEuF1YEiBLdgyw/SBfwO+niMGYG/L51sA+/Ba6uI/ai\nvyvSp9DA8YVgK4Jnf6o08+apw3iYTU/TqY1QLyYu22Ia3ZeuvJgVVqgwdBfdGbTs\nXh4jPeyjJRc8lPUsvyS/SUTeOIFkCrnGmaF+FRYC58tsZy3sTuZjGlD0rcXrFAar\nN9XrW7gk9Lbco9OuYsNb3/fm+TNABk0pI58fAmEFLZH9uZSuuIvvfjkY3gTanKpq\n0qBUneziEXLY1X1mmthlVHvLLEMlDQ/fhlyFJPke5eZHiueWGSCHQJO/FtbDrOv4\nQa+hulFjAgMBAAECggEADfGHXDQ+S/vfdfcFObx4QSlLJQHK1obP3yfMRQVGjIrd\nAtfLG1UDIkwgSlTdhg+EiG1EydnRF1vAv7gfjC3oO0m/eilNF9TY48JfiVx4yleL\nVXQPpwKHt/Jv92olOAkb12MUtMDyP0dp2lbP1MXO0kTTsc0WrgVb2ElskT7Y5RSd\na1l9ykrv04hC3PaI9cctFD9wU1bThaR+kbp+ehLRy93zLTFY+jN1TvDfO3ZjOVPh\nxdctlgrJOIaGptLPfuw17v6eRG2tn+J3P54CUf2DYJSdJexrFGOKowBkKDRt3e0T\n9tpMvjJ3wbex8ClRyDiiIdcIUWqbN40Qe4DvhNjXXQKBgQD70h/l1abeyDafw7ZZ\n1JdN+x5yZFAq7OCSCdaa+v2EbfmEbnwl08WxOMvb12eXP4x0bomgKZSljq7nXSbf\nCwT9u2i1twARR64eWRCdfaqrTWHJ821qDfEvaKzWZTAIeabtOkzUfMEVNMpVZWlA\nZpytF0oRQO0U8pQucEPCDLSH/wKBgQD6HiKxmSXe1bABiqhm5Lbta1ZFdjKykUxD\n/P0XMk8dyJ7hS58sHyoIraEBAe+w5+WU1Wq33rzxmu2CVtwvUoz0q3KUKZH9/SOz\nzI/lLcjacGusE1onBryW/pU1iZoqoaNq31Vh0FzFbNy9xmrPRjPtvFIfn35jXecx\nN7YJlK0WnQKBgQCZOWjJS3Am3IJIQijBjhamj2ceSaVyCQI4Oh5H3PLHUrdhemy2\nA56l0B5S3UWeBT/sVJoPR124QxJvmwGc87KMxSzYbMpwuUHcG2t9uMpRQ1t+K01n\nG6ampzWLmrRYY9VLQY8gN+ywf5eh0HvzgLxSofoid3QKq/O4Mf04pMxwdwKBgQCX\nd3h7JMuSTsXvqRCifw9oaAAuwI2jJeqRobuDOKxA1SWiOjGCfrzt1HgULCADeevG\nXhfqkbDKf5AlxoRBBDToVotkvmfy8EGWuOLLXxarcjlCU9XcnG/I4RNrAJGkD47v\nQaBrQ8tqo6pqIqa8Lz9zUQBKtkPL2SoQ3DQZSTgo4QKBgQDBaxAaDW5nlQgKojGH\nn+BIU5VY3cXGytm9U1Xky+RW/LADT/tJeQ9RHh+mDgidYyaXzcFYOi3zmxm68jO1\nvdb/h0ruhAuwZDra5RHa9zRgdH4tEuOayw6e+5pg2eEHJFrvq4Jsm6k33iRclKw3\n1T/VfPd4pY2yjTtdlETNcOQvTw==\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@gsheets-348506.iam.gserviceaccount.com",
  "client_id": "108058659095328094189",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40gsheets-348506.iam.gserviceaccount.com"
}

  ''';
  static const _spreadsheetid = '1kH_KySUD2_BEAEnEg7xT6g_R8gwng6R7hGs2f3H0UfI';
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
