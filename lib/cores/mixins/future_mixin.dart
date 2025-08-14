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
          const SizedBox(height: 10,),
          if(onPressedRetry!=null)
          ElevatedButton(onPressed: (){onPressedRetry();}, child: const Text('Retry'))
        ],)
    );
  }

  Widget buildNoData(){
    return const Center(
      child: Text('No Data.')
    );
  }

  @override
  Widget buildSuccess(data);
}
