
import 'package:flutter/material.dart';
import 'package:news_app/layout/Cubit/Cubit.dart';
import '../../modules/webView.dart';
Widget builtArticleItem (context, model){
   String pic;
   if(model['urlToImage']==null)
   pic='https://fossbytes.com/wp-content/u'
       'ploads/2019/11/The-Best-Android-News-Apps-For-You.jpg';
   else pic=model['urlToImage'];
   return InkWell(
     onTap: (){
       navigateTo(context, WebViewScreen(model['url']));
        },
     child: Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
            image: NetworkImage(
                 pic),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(

          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${model['title']}',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: NewsCubit.get(context).isdark ? TextStyle( fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,) : TextStyle( fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,)
                  ),
                ),
                Text('${model['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),)
              ],
            ),
          ),
        )
      ],
  ),
),
   );

}
Widget myDivider() =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
  width: double.infinity,
  height: 1,
  color: Colors.grey[300],
),
    );
 void navigateTo (context, widget) =>Navigator.push(context, MaterialPageRoute(builder: (context)=> widget,),
 );


