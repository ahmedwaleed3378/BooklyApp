import 'package:bookly_app/core/widgets/book_actions_button.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomBookRow extends StatelessWidget {
  const CustomBookRow({super.key, required this.book});
final BookModel book;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
     const   Expanded(
          child: BookActionsButton(
          
            backGroundColor: Colors.white,
            radius:  BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            textColor: Colors.black,
            text: 'Free',
          ),
        ),
        Expanded(
          child: BookActionsButton(  onPressed: () async{
              Uri uri= Uri.parse(book.volumeInfo!.previewLink??'');
              if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
              }else{}
            },
            backGroundColor:const Color.fromRGBO(239, 130, 98, 1),
            radius:const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            textColor: Colors.white,
            text: 'Free preview',
          ),
        ),
      ],
    );
  }
}
