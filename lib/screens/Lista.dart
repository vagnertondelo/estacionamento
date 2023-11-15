import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../components/Header.dart';
import '../components/Menu.dart';

import 'package:get/get.dart';

import '../controllers/ParkingSpot.dart';
import 'Edit.dart';
class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  var controller = ParkingSpotController.parkingSpotController;

  @override
  void initState() {
    super.initState();
    controller.listParkingSpot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context),
      drawer: Menu(context),
      body:
          Obx(() => controller.isLoading.value
          ?
          const Center(child: CircularProgressIndicator())
          :

      ListView.builder(
        itemCount: controller.listParkingSpotObs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(controller.listParkingSpotObs[index].licensePlateCar),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Get.to(Edit(
                      objeto: controller.listParkingSpotObs[index]
                    ));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                   var response = await controller.deleteParkingSpot(controller.listParkingSpotObs[index]);
                    if(response !=false){
                      Get.snackbar("Sucesso", "Deletado com sucesso");
                      await controller.listParkingSpot();
                    }else{
                      Get.snackbar("Erro", "Erro ao deletar");
                    }


                  },
                ),
              ],
            ),
          );
        },
      ),)
    );
  }
}

