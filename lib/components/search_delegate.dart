import 'package:flutter/material.dart';

List userName=[
  "Ahmed",
  "Mohamad",
  "Ali",
  "Hussam",
  "Hasan",
  "Walid",
  "Zeinab"
];

class SearchDelegateScreen extends StatefulWidget {
  const SearchDelegateScreen({super.key});

  @override
  State<SearchDelegateScreen> createState() => _SearchDelegateScreenState();
}

class _SearchDelegateScreenState extends State<SearchDelegateScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener((){
      print("${scrollController.offset}");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        scrollController.animateTo(
            scrollController.position.maxScrollExtent
        , duration: Duration(seconds: 1), curve: Curves.easeIn);
      }),
      appBar: AppBar(
        title: const Text("Search Delegate"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: ListView(
        controller: scrollController,
        children: [
          ...List.generate(200, (index) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(index.toString()),
          ),)
        ],
      ),
    );
  }
}

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    for(int i=0;i<userName.length;i++){
      String x = userName[i].toString();
      userName[i]=x.toLowerCase();
    }
    if(query==""){
      return ListView.builder(
        itemCount: userName.length,
        itemBuilder: (context, index) {
          return Card(child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(userName[index],
              style: TextStyle(fontSize: 16.0),),
          ),
          );
        },);
    }else{
      List filterList = userName.where((element)=>element.contains(query)).toList();
      return ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (context, index) {
          return Card(child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(filterList[index],
              style: TextStyle(fontSize: 16.0),),
          ),
          );
        },);
    }

  }
}
