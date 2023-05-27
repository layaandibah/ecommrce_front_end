
import 'dart:io';

import 'package:flutter/material.dart';

checkInternet()async{
//تجرب هذه الدالة ان تفتح غوغل وتأخذ منه ليست من العنواين والصفحات
try{
 var result=await InternetAddress.lookup("google.com");
if(result.isNotEmpty && result[0].rawAddress.isNotEmpty)
  return true;
}on SocketException catch(_){
 return false;
}



}