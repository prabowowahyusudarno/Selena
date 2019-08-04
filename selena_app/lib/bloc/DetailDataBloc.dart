
import 'package:rxdart/rxdart.dart';
import 'package:selena_app/model/response/DataResponse.dart';
import 'package:selena_app/model/response/DetailDataResponse.dart';
import 'package:selena_app/repository/DataRepository.dart';

class DetailDataBloc{

  final _repository = DataRepository();
  final _detailDataFetcher = PublishSubject<Data>();
  Observable<Data> get getStreamDetailData => _detailDataFetcher.stream;




  getDetailData(String slug) async {
    try {
      DetailDataResponse response = await _repository.getDetailData(slug);
      if (response != null) {
        _detailDataFetcher.sink.add(response.data);
        print("Masuk Om");

      } else {
        _detailDataFetcher.sink.addError("Terjadi Kesalahan Sistem");
        print("Ngga Masuk Om");
      }
    } on FormatException catch (error) {
      _detailDataFetcher.sink.addError(error.message);
      print("Error Om");
    }
  }

  dispose(){
    _detailDataFetcher.close();
  }
}

final detailDataBloc = DetailDataBloc();