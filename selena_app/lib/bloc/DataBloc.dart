
import 'package:rxdart/rxdart.dart';
import 'package:selena_app/model/response/DataResponse.dart';
import 'package:selena_app/repository/DataRepository.dart';

class DataBloc{

  final _repository = DataRepository();
  final _dataFetcher = PublishSubject<List<Datum>>();
  Observable<List<Datum>> get getStreamData => _dataFetcher.stream;




  getData() async {
    try {
      DataResponse response = await _repository.getData();
      if (response != null) {
        _dataFetcher.sink.add(response.data);
      } else {
        _dataFetcher.sink.addError("Terjadi Kesalahan Sistem");
      }
    } on FormatException catch (error) {
      _dataFetcher.sink.addError(error.message);
    }
  }

  dispose(){
    _dataFetcher.close();
  }
}

final dataBloc = DataBloc();