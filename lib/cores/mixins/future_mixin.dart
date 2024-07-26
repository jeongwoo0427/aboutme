import 'package:flutter/material.dart';

mixin  FutureMixin{

  Widget buildLoader(){
    return const Center(
      child: Padding(padding: EdgeInsets.symmetric(vertical: 100), child: CircularProgressIndicator()),
    );
  }

  Widget buildError({required String errMsg, Function? onPressedRetry}){
    return Center(
        child: Column(children: [
          Text(errMsg),
          SizedBox(height: 10,),
          if(onPressedRetry!=null)
          ElevatedButton(onPressed: (){onPressedRetry();}, child: Text('Retry'))
        ],)
    );
  }

  Widget buildNoData(){
    return Center(
      child: Text('No Data.')
    );
  }

  @override
  Widget buildSuccess(data);
}
