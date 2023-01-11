import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import '../../Services/AuthServices.dart';
import '../../model/Car.dart';

class DashProvider extends ChangeNotifier{
    List<Car> cars=[];
    bool recievedData=false;
    String totalCars="0";
    String totalUser="0";
    int seletecdIndex=0;


    DashProvider(){
        getCarsData();
        callCountFunction();

    }

    Future<String> readImage(String imagepath) async{
        return await Services.FetchImage(imagepath);
        notifyListeners();
    }

    void changeSeletcedIndex(int index){
        seletecdIndex=index;
        notifyListeners();
    }

    void getCarsData() async{
        cars=await Services.FetchCarDetails();
        recievedData=true;
        notifyListeners();
    }

    void callCountFunction() async{

        totalCars= await Services.FetchTotalCar();
        print("toatl cars: "+totalCars);
        //Fetching total number of users
        totalUser=await Services.FetchTotalUser();
        notifyListeners();
    }
}