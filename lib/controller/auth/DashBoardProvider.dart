import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import '../../Services/AuthServices.dart';
import '../../database/sqlite.dart';
import '../../model/Car.dart';

class DashProvider extends ChangeNotifier{
    List<Car> cars=[];
    bool recievedData=false;
    String totalCars="0";
    String totalUser="0";
    int seletecdIndex=0;
    String USerEmai="";

    DashProvider(){
        getCarsData();
        callCountFunction();

    }

    void deleteAuth(){
        LiteSolution.deleteAuth();
    }

    Future<String> readImage(String imagepath) async{
        return await Services.FetchImage(imagepath);
        notifyListeners();
    }

    void changeSeletcedIndex(int index){
        seletecdIndex=index;
        notifyListeners();
    }

    Future<String> getEmail() async{
       String res=await LiteSolution.getEmail();
       USerEmai=res;
       return res;
    }

    void getCarsData() async{
        cars=await Services.FetchCarDetails();
        recievedData=true;
        notifyListeners();
    }

    void callCountFunction() async{

        totalCars= await Services.FetchTotalCar();
        //Fetching total number of users
        getEmail();
        totalUser=await Services.FetchTotalUser();
        notifyListeners();
    }
}