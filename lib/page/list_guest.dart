import 'package:bukit_vista_app/model.dart';
import 'package:bukit_vista_app/page/detail_page.dart';
import 'package:bukit_vista_app/theme.dart';
import 'package:flutter/material.dart';

class ListGuest extends StatelessWidget {
  const ListGuest({Key? key}) : super(key: key);
  static const routeName = '/list_guest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        flexibleSpace:Column(
          children: [
             Padding(
              padding: const EdgeInsets.only(top: 34),
              child: Center(
                child: Text('Guest List', style: titleAppbar,),
              ),
            ),
            Row(
              children:  [
                Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                    left: 30,
                  ),
                  height: 50,
                  width: 290,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8 ,
                        horizontal: 5
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.search_rounded),
                      hintText: "Search your guest name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  width: 50,
                  height: 50,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.filter_list),
                  ),
                )
              ],
            ),
          ],
        ) ,
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context).loadString('asset/reverse.json'),
          builder: (context , snapshot){
          final List<Guest> guest = parseGuest(snapshot.data);
          return ListView.builder(
            itemCount: guest.length,
              itemBuilder: (context, index) => _buildItemGuest(context, guest[index])
            );
          }
      )
    );
  }

  Widget _buildItemGuest(BuildContext context , Guest guest){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, DetailPage.routeName , arguments: guest);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16 ,
          vertical: 8
        ),
        child: Card(
          shape: RoundedRectangleBorder(side: const BorderSide(
            color: Color(0xff777676),
            width: 0.1,
          ),
            borderRadius: BorderRadius.circular(10)
          ),
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                 children: [
                   ClipRRect(
                     borderRadius: BorderRadius.circular(180),
                     child: Image.network(guest.pictureId, width: 60, height:  60 , fit: BoxFit.cover,),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(guest.name , style: titleList),
                         const SizedBox(height: 5,),
                         Text(guest.location, style: subtitleList,)
                       ],
                     ),
                   ),
                 ],
                ),
                const Icon(Icons.arrow_forward_ios_outlined,
                  size: 16, color: Colors.lightBlueAccent,)
              ],
            ),
          )
        )
      ),
    );
  }
}
