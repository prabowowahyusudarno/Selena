import 'package:selena_app/api_provider/api_provider.dart';

class DataRepository {
  final apiProvider = ApiProvider();

  Future getData() =>
      apiProvider.getData();

  Future getDetailData(String slug) =>
      apiProvider.getDetailData(slug);

}