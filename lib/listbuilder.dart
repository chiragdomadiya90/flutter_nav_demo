import 'package:flutter/material.dart';

class ListBuil extends StatelessWidget {
  const ListBuil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> item = [
      {
        "title": 'Tom and Jerry',
        'img': 'https://wallpapercave.com/dwp1x/wp5229067.jpg'
      },
      {
        "title": 'Chhota Bhim',
        'img': 'https://wallpapercave.com/dwp1x/wp9180586.jpg'
      },
      {
        "title": 'Chin-Chan',
        'img': 'https://wallpapercave.com/wp/wp4873935.jpg'
      },
      {
        "title": 'Mickey Mouse',
        'img': 'https://wallpapercave.com/uwp/uwp66399.jpeg'
      },
      {
        "title": 'Scooby Doobey',
        'img': 'https://wallpapercave.com/dwp1x/wp5355128.jpg'
      },
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: item.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 200,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Text(
                        item[index]['title'],
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            color: Colors.black),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(item[index]['img']),
                                fit: BoxFit.fill),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
