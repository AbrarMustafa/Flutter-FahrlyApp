
import 'package:collection/collection.dart';


int getPercentageOnsale(double sale_price,double price) {
    double percent= ( sale_price/price ) ;
    percent=percent*100;
    return (100-percent).toInt();
}