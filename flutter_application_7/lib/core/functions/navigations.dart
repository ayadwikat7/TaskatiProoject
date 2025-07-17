import 'package:flutter/material.dart';

pushTo(BuildContext context,Widget NeScreen){
        Navigator.push( context, MaterialPageRoute(builder: (context){
        return  NeScreen;
      }
      )
      );
    }

pushToWithReplacment(BuildContext context,Widget NeScreen){
        Navigator.pushReplacement( context,
         MaterialPageRoute(builder: (context){
        return  NeScreen;
      }
      )
      );
    }