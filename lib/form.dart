import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({Key? key}) : super(key: key);

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {

  // 3 variables pour stocker les champs saisi
  late double note1;
  late double note2;
  late double note3;
  double maMoyenne = 0;
  late String appreciation;

  @override
  void initState() {
    super.initState();
    note1 = 0;
    note2 = 0;
    note3 = 0;
    maMoyenne = 0;
  }

  double calculMoyenne(double note1, double note2, double note3){
    double maMoyenne = ((note1 + note2 + note3)/3);
    print(maMoyenne);
    return maMoyenne;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Calcul ma moyenne")),
        body: Column(children: [
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 100,
                child: Text("Backend"),
              ),
              SizedBox(
                height: 40,
                width: 200,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      // conversion du string en double pour stocker 
                      note1 = double.parse(value);
                    });
                  },
                  
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter votre note',
                  ),
                ),
              )
            ],
          ),
          Row(
            children:  [
              SizedBox(
                height: 40,
                width: 100,
                child: Text("Front"),
              ),
              SizedBox(
                height: 40,
                width: 200,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      // conversion du string en double pour stocker 
                      note2 = double.parse(value);
                    });
                  },
                
                  //keyboardType:TextInputType.numberWithOptions(decimal: true) ,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter votre note',
                  ),
                ),
              )
            ],
          ),
           Row(
            children:  [
              SizedBox(
                height: 40,
                width: 100,
                child: Text("Spécialité"),
              ),
              SizedBox(
                height: 40,
                width: 200,
                child: TextField(
                  onChanged: ((value) {
                    note3 = double.parse(value);
                  }),
                  //keyboardType:TextInputType.numberWithOptions(decimal: true) ,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter votre note',
                  ),
                ),
              )
            ],
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              this.maMoyenne = calculMoyenne(this.note1, this.note2, this.note3);
            });
          }, child: const Text("Calcul")),
          SizedBox(
            height: 100,
            width: 300,
            child: Text("Appréciation : $maMoyenne"),
          )
          
        ]),
      ),
    );
  }




}
