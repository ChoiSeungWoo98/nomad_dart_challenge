typedef MapStrAndObj = Map<String, dynamic>;
typedef ListInMap = List<MapStrAndObj>;
typedef StringList = List<String>;

enum ColorType {lightGreen, yellow, blue, mint}

void addMap (ListInMap origin, Map<String, dynamic> addData) => origin.add(addData);

void getColor (MapStrAndObj data) => print(data["color"]);

void deleteMap (ListInMap list, String company) {
  if (list.isEmpty) {
    print("list empty...");
    return;
  }
  int deleteIdx = 0;

  list.asMap().forEach((idx, data) {
    if(data["company"] == company) deleteIdx = idx;
  });

  list.removeAt(deleteIdx);
}

void updateMap({required ListInMap ori, required MapStrAndObj data, required String changeStr}) {
  if (ori.isEmpty || data.isEmpty || changeStr.isEmpty) {
    print("data empty...");
    return;
  }
  ori.asMap().forEach((idx, oriData) {
    if(oriData["company"] == changeStr) ori[idx] = data;
  });
}

void showAll(ListInMap allData) {
  if(allData.isEmpty) {
    print("list empty...");
    return;
  }
  allData.forEach((data) {
    print(data);
  });
}

int totalCnt(ListInMap list) => list.length;

void listUpsert(ListInMap ori, MapStrAndObj insertData) {
  if (ori.isEmpty || insertData.isEmpty) {
    print("data empty...");
    return;
  }
  bool notEquals = true;
  int index = 0;

  ori.asMap().forEach((idx, oriData) {
    if(oriData['color'] == insertData['color']) {
      notEquals = false;
      index = idx;
    }
  });
  if(notEquals) {
    ori.insert(ori.length, insertData);
  } else {
    ori[index] = insertData;
  }
}

void exists(ListInMap ori, String company) {
  if (ori.isEmpty || company.isEmpty) {
    print("data empty...");
    return;
  }
  bool exists = false;
  ori.forEach((oriData) {
    if (oriData['company'] == company) {
      exists = true;
    }
  });

  exists ? print("Exist!!!") : print("not Exist..");

}

void bulkAdd(ListInMap ori, ListInMap newData) => ori.insertAll(0, newData);

void bulkDelete(ListInMap ori, StringList newData) {
  if (ori.isEmpty || newData.isEmpty) {
    print("list empty...");
    return;
  }
  ori.removeWhere((map) => newData.contains(map['company']));
}