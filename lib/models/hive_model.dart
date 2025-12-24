import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveModel {
  static final HiveModel _hiveModel=HiveModel._internal();
  factory HiveModel()=>_hiveModel;
  HiveModel._internal();
  Box? box;

  Future<Box>init()async{
    if(!Hive.isBoxOpen("myBox")){
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
    }
    box = await Hive.openBox("myBox");
    return box!;

    // return await Hive.openBox("myBox"); بدل المتغير box
  }

  void addData(String value){
    box!.add(value);
  }

  // void addData(String title,String value){
  //   box!.addAll([title,value]);
  // }لو هدخل مصفوفة


  List<String> getData(){
    return box?.values.cast<String>().toList() ?? [];
  }

  void deleteData(int index){
    box!.deleteAt(index);
  }
  // deleteALL يمسح كل اللى فى الليست


}