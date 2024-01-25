import 'package:flutter/cupertino.dart';
import 'package:responsive_design/widget/reusable_text.dart';

class ProductViewDetails extends StatelessWidget {
  final String title;
  final String name;
  final Size size;


  const ProductViewDetails({super.key,  required this.title, required this.name, required this.size,});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child:
                    ReusableTextWidget(text: title,textAlign: TextAlign.start,fontWeight: FontWeight.w400,fontSize:(size.height+size.width/2)*0.015,) ,
                  ),
                ],
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Row(
            children: [

              ReusableTextWidget(text: name,textAlign: TextAlign.start,fontWeight: FontWeight.w500,fontSize:(size.height+size.width/2)*0.015,) ,
            ],
          ),
        ),
      ],
    );
  }
}