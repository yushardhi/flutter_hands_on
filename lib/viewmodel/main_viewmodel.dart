
import 'package:flutter_hands_on/model/resp.dart';
import 'package:flutter_hands_on/util/endpoint.dart';
import 'package:flutter_hands_on/util/network.dart';

class MainViewModel {

  Future<Resp> getList({String jsonFiles}) async {
    var resp =
    await Network.getApi('${Endpoint.TMP_FILES_URL}/$jsonFiles');
    print('$jsonFiles = $resp');
    Resp data = Resp.fromJson(resp);
    return data;
  }

}