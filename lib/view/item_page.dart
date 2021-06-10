
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hands_on/model/item.dart';
import 'package:flutter_hands_on/view/detail_page.dart';
import 'package:flutter_hands_on/viewmodel/main_viewmodel.dart';

class ItemPage extends StatefulWidget {
  ItemPage({Key key, this.title, this.jsonFiles}) : super(key: key);
  final String title;
  final String jsonFiles;

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  MainViewModel _mainViewModel = MainViewModel();
  List<Item> itemList;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await _mainViewModel.getList(jsonFiles: widget.jsonFiles).then((response) {
      print(response);
      if (mounted) setState(() {
        this.itemList = response.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: itemList==null ? Center(child: CircularProgressIndicator(),)
          : itemList.length==0 ? Center(child: Text('No data.'))
          : ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (_, index) {
          Item item = itemList[index];
          return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage(title: 'Detail Page', item: item,))),
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
