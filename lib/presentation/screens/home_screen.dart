import 'package:flutter/material.dart';
import 'package:hive_task/core/app_colors.dart';
import 'package:hive_task/models/hive_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final textController = TextEditingController();
  final HiveModel hiveModel=HiveModel();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        foregroundColor: AppColors.blue,
        centerTitle: true,
        title: Text("Hive Task",
        ),
        
       
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          
          children: [
            const SizedBox(height: 20,),
          TextFormField(
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your name"
            ),
          ),

           const SizedBox(height: 20,),
        
          ElevatedButton(
            onPressed: (){
            if(textController.text.isNotEmpty){
              setState(() {
                hiveModel.addData(textController.text);
                textController.clear();
              });
            }else{
              print("its empty");
            }
          },
           child: Text("Add")),

           const SizedBox(height: 20,),

           Flexible(
             child: ListView.builder(
              shrinkWrap: true,
              itemCount: hiveModel.getData().length,
              itemBuilder: (context,index){
              final data = hiveModel.getData();
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.blue,
                  child: Text(index.toString(),
                  style: TextStyle(
                    color: AppColors.darkBlue
                  ),),
                ),
                title: Text(data[index],
                 style: TextStyle(
                    color: AppColors.darkBlue
                  ),),
              );
             }),
           )
        ],),
      ),
    );
  }
}