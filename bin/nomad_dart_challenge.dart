import 'package:nomad_dart_challenge/nomad_dart_challenge.dart' as nomad_dart_challenge;

void main() {
  final naver = "NAVER";
  final kakao = "KAKAO";
  final coupang = "COUPANG";
  final baemin = "BAEMIN";
  final line = "LINE";

  final naverData = {"company" : naver, "color" : nomad_dart_challenge.ColorType.lightGreen};
  final kakaoData = {"company" : kakao, "color" : nomad_dart_challenge.ColorType.yellow};
  final coupangData = {"company" : coupang, "color" : nomad_dart_challenge.ColorType.blue};
  final baeminData = {"company" : baemin, "color" : nomad_dart_challenge.ColorType.mint};
  final lineData = {"company" : line, "color" : nomad_dart_challenge.ColorType.lightGreen};

  nomad_dart_challenge.ListInMap totalColorByCompany =
  [
    naverData,
    kakaoData
  ];

  nomad_dart_challenge.ListInMap addData =
  [
    naverData,
    kakaoData
  ];

  nomad_dart_challenge.StringList deleteData =
  [
    coupang,
    baemin
  ];

  print("(5)1. totalColorByCompany");
  print("--------------------");
  nomad_dart_challenge.showAll(totalColorByCompany);
  print("");

  print("(1)2. add Coupang");
  print("--------------------");
  nomad_dart_challenge.addMap(totalColorByCompany, coupangData);
  nomad_dart_challenge.showAll(totalColorByCompany);
  print("");

  print("(2)3. get First Company Color");
  print("--------------------");
  totalColorByCompany.isNotEmpty ? nomad_dart_challenge.getColor(totalColorByCompany[totalColorByCompany.length - 1]) : print("list empty...");
  print("");

  print("(3)4. delete KaKao");
  print("--------------------");
  nomad_dart_challenge.deleteMap(totalColorByCompany, kakao);
  nomad_dart_challenge.showAll(totalColorByCompany);
  print("");

  print("(4)5. updateCompany");
  print("---------- coupang => badmin ----------");
  nomad_dart_challenge.updateMap(ori : totalColorByCompany, data : baeminData, changeStr : coupang);
  nomad_dart_challenge.showAll(totalColorByCompany);
  print("");

  print("6. totalCount");
  print("--------------------");
  print(nomad_dart_challenge.totalCnt(totalColorByCompany));
  print("");

  print("7. upsert");
  print("----------naver => line----------");
  nomad_dart_challenge.listUpsert(totalColorByCompany, lineData);
  nomad_dart_challenge.showAll(totalColorByCompany);
  print("---------coupang insert-----------");
  nomad_dart_challenge.listUpsert(totalColorByCompany, coupangData);
  nomad_dart_challenge.showAll(totalColorByCompany);
  print("");

  print("8. exist");
  print("---------$line-----------");
  nomad_dart_challenge.exists(totalColorByCompany, line);
  print("---------$naver-----------");
  nomad_dart_challenge.exists(totalColorByCompany, naver);
  print("");

  print("9. bulkAdd");
  print("----------add naver and kakao----------");
  nomad_dart_challenge.bulkAdd(totalColorByCompany, addData);
  nomad_dart_challenge.showAll(totalColorByCompany);
  print("");

  print("10. bulkDelete");
  print("----------delete coupang and baemin----------");
  nomad_dart_challenge.bulkDelete(totalColorByCompany, deleteData);
  nomad_dart_challenge.showAll(totalColorByCompany);
  print("");

}

