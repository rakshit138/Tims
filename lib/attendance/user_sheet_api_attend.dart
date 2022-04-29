import 'package:gsheets/gsheets.dart';
import 'user_attend.dart';

class UserssheetApiAtt {
  static const _credentialsAtt = r'''
  {
  "type": "service_account",
  "project_id": "attend-348705",
  "private_key_id": "c72ba9b6862da3fd61ef0ad574e6ee1d1b732103",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDDzeZuEdPK2j7r\nhCgfto3TdQv5gSckwQhHEyyjX1dejAyPCqg0rsz8shkuRSm5ACcWW4OUtPEkxHao\nmWRUEXoeNJBx+FblzCoiOyfA/jXlDPSzyLOng8945S81YVS+3VgmCpeX2M75oO9V\nlHfnOGd1c5lw3H33uj+dyng7xb1kOyXfCxJ/XaSGFrULMxzyYAx2ySwV5W9kXw4W\nxmMZRGx1WuO/5rB6SM/zhF+VhzYBEOgf82WojGX+bqSwvbjLBeX/52E1JAStcUNe\nlOm6IMGtp+JWwZhSvFbbv+AeI/NOEaYz828yd30CvI/+6l1+BqNkkADzd9OFkx99\nzMwpzl6rAgMBAAECggEAIoXUIgYMpJB0VYwYkvbZ7LWPZe9qmmVac0WjMi7mNapV\nsIa9f4RuagNwwyK4p4CqY5vBCGAawFPPZAyfjt8B+/9ilGWn1J55s01gxftMP1VY\nc7ZoTpnD49nsx+mgSoK2PwbREZnNbF/+ssUZmu/r9d5q6GZH43y4KLcBGfDUYq5n\nbp1EaRKhR8x+8y6xb1j9BjSbWwav1jvqhero/4DdtPFaKh4NCDTVcmCmRR1GPAuT\nTi1GQhQOYxNr/Jznd5zPhu6cSindUw50xwl0pQrucalBCnP2P9N7lFIFIVGPeOVj\nW32Xbi1R7hSLIwFGb3ZWUEkoFB3t/OaR/NxekJHNUQKBgQD/RwwCVLLP46xotzkB\nUoBRAyk5yDMbyJxFjmh9TTrq6HTLYaC4lytuQpVT108FLCDkvGI43TcOTj62AFKt\nUpE+jglaTWjTVcZ97/4eMqWyEjx3vaZWEG/5nFKCDnifulRYI81cpPtjaKqJKY/y\n9JJSXZO+kgtQ/TIoDGpJOZQZOQKBgQDEW8OISHb68/ND8D5U09y1/0wqlcmopAe2\nb5DbFkgAGn1SfgnnLTnWEPN2ZurGFRSJ9p5Y9p36acLRa/Y+CesuBPkNEbvHtacv\nkLPTNLgnRw91PSndkdF2Q9hMmHuQq5TM1g9G3ZSOgSK6CEc4Yk/JvFAbiXUl4nhu\nXGVtLwGrAwKBgQCseF3evUbKOfJkFVZIVGspUM9roJ0XKmSageqKrcEesMsoFd+2\nlzvalNW6/X7/6Z6Xq8dYz+zAl5C6+mDhhSVodCJRhndKQWuH7rtrv6A/PR7pb5KQ\nFy7wH/OGtyw8DnGp0xaOf1DxCugdH52H8kFhsKN/X8CRiV93u1ub+XDb0QKBgC9b\nalcuEvQHbf5OrNnMlwiV4ArNQWuY0/teAPO19fuAaAVDPKQytiY4xF8kBy9q2h9E\nCYCvSf6hD0lu3l6sCbp5nI9YXY+W8hF4tsYTiu5+Ju5BqB02E+yQBFTE2dhUaXjV\nj62ptzB/WJ7BbFve6htffXqGtmhCrIUBZ7zjf2V9AoGALimIhXB0Uwxo/eWVOj5d\n7w3MhTXPLpNAqAGK8oFFGN1JghJfCwR43fTsggUjs/U3zidNXoO+xHgFH3vEaNPB\nHJAGdGN7KghFQkdlh5Q3wd5iLaKKb6orjh+ZhWK+2f8ofkhKSOWUxnahMgLNhuHv\nBjbrAPhIdk8IajFNMd73K7k=\n-----END PRIVATE KEY-----\n",
  "client_email": "ghseets1@attend-348705.iam.gserviceaccount.com",
  "client_id": "109890008977248775169",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/ghseets1%40attend-348705.iam.gserviceaccount.com"
}

  ''';
  static const _spreadsheetidAtt =
      '1yDseGIrYLklXpvttrN3QE_TKPqq_oU4JS81Yw-3pl5I';
  static final _gsheetsAtt = GSheets(_credentialsAtt);
  static Worksheet? _userSheetAtt;

  static Future init() async {
    try {
      final spreadsheetAtt = await _gsheetsAtt.spreadsheet(_spreadsheetidAtt);
      _userSheetAtt = await _getWorkSheet(spreadsheetAtt, title: 'Attend');

      final firstrow = UserfieldsAtt.getfields();
      _userSheetAtt!.values.insertRow(1, firstrow);
    } catch (e) {
      print('initerror :$e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheetAtt, {
    required String title,
  }) async {
    try {
      return await spreadsheetAtt.addWorksheet(title);
    } catch (e) {
      return spreadsheetAtt.worksheetByTitle(title)!;
    }
  }

  static Future<int> getRowCount() async {
    if (_userSheetAtt == null) return 0;

    final lastRow = await _userSheetAtt!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }

  static Future<List<UserAtt>> getAll() async {
    if (_userSheetAtt == null) return <UserAtt>[];
    final users = await _userSheetAtt!.values.map.allRows();
    return users == null ? <UserAtt>[] : users.map(UserAtt.fromJson).toList();
  }

  static Future<UserAtt?> getById(int id) async {
    if (_userSheetAtt == null) return null;
    final json = await _userSheetAtt!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : UserAtt.fromJson(json);
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheetAtt == null) return;
    _userSheetAtt!.values.map.appendRows(rowList);
  }

  static Future<bool> update(
    int id,
    Map<String, dynamic> user,
  ) async {
    if (_userSheetAtt == null) return false;

    return _userSheetAtt!.values.map.insertRowByKey(id, user);
  }
}
