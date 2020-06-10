import 'package:Clinicarx/app/services/api.dart';

class IssueReportRepository {
  final _api = new ApiService();

  Future sendIssueReport(String comment) async {
    return await _api.postRequest('issuereport', comment);
  }
}
