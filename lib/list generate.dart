import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Map<String, dynamic>> categoryItems = [
    {
      "title": "Fast Delivery",
      "icon": Icon(Icons.delivery_dining),
    },
    {
      "title": "Store in my area",
      "icon": Icon(Icons.location_on),
    },
    {
      "title": "Previous orders",
      "icon": Icon(Icons.book_outlined),
    },
    {
      "title": "Popular",
      "icon": Icon(Icons.star_border),
    }
  ];
  List<String> orderType = ["Delivery", "Pick Up"];
  int categorySelected = 0;
  int orderTypeSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(
                    width: 130,
                  ),
                  Text(
                    "Filter",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                children: List.generate(
                    categoryItems.length,
                    (index) => Column(
                          children: [
                            ListTile(
                              onTap: () {
                                setState(() {
                                  categorySelected = index;
                                });
                              },
                              leading: CircleAvatar(
                                  backgroundColor: Colors.green.shade100,
                                  radius: 20,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: categoryItems[index]['icon'],
                                    color: Colors.green,
                                  )),
                              title: Text(categoryItems[index]['title']),
                              trailing: categorySelected == index
                                  ? Container(
                                      height: 23,
                                      width: 23,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 23,
                                      width: 23,
                                      decoration: BoxDecoration(
                                          //color: Colors.grey,
                                          border:
                                              Border.all(color: Colors.grey),
                                          shape: BoxShape.circle),
                                    ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                          ],
                        )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "ORDER TYPE",
                textAlign: TextAlign.start,
              ),
              Row(
                children: List.generate(
                    orderType.length,
                    (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              orderTypeSelected = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            height: 45,
                            width: 170,
                            decoration: BoxDecoration(
                                color: orderTypeSelected == index
                                    ? Colors.green
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Row(
                                  children: [
                                    Text(
                                      orderType[index],
                                      style: TextStyle(
                                          color: orderTypeSelected == index
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 23,
                                      width: 23,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: orderTypeSelected == index
                                                  ? Colors.transparent
                                                  : Colors.grey),
                                          color: orderTypeSelected == index
                                              ? Colors.white
                                              : Colors.transparent,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color: orderTypeSelected == index
                                              ? Colors.green
                                              : Colors.transparent,
                                          size: 12,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
