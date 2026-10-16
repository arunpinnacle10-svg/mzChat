import 'package:flutter/material.dart';

class register extends  StatefulWidget{
    const register({super.key});

  @override
  State<StatefulWidget> createState() => registerScreen();


}


class registerScreen extends State<register>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Card(
            child:Column(children: [
              Text("User Name : "),
              TextFormField(decoration: InputDecoration(hintText: "User Name", border: OutlineInputBorder()),)
            ],),
            elevation: 10,
            color: Theme.of(context).primaryColorLight,

          ),
        )

      ],
    );
  }

}