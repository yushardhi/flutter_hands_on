
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hands_on/model/item.dart';
import 'package:flutter_hands_on/view/item_page.dart';
import 'package:flutter_hands_on/viewmodel/main_viewmodel.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  MainViewModel _mainViewModel = MainViewModel();
  List<Item> categoryList;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await _mainViewModel.getList(jsonFiles: 'index.json').then((response) {
      print(response);
      if (mounted) setState(() {
        this.categoryList = response.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: categoryList==null ? Center(child: CircularProgressIndicator(),)
          : categoryList.length==0 ? Center(child: Text('No data.'))
          : ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: categoryList.length,
        itemBuilder: (_, index) {
          Item item = categoryList[index];
          return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ItemPage(title: item.name, jsonFiles: item.listData,))),
            child: Container(
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CachedNetworkImage(
                        imageUrl: item.img,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
