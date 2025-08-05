import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ui_notes/note_modal.dart';

import 'constant.dart';

class PersonalNote extends StatefulWidget {

  final VoidCallback onToggleTheme;
  const PersonalNote({
   required this.onToggleTheme,
    super.key});



  @override
  State<PersonalNote> createState() => _PersonalNoteState();
}

class _PersonalNoteState extends State<PersonalNote> {
  bool isGrid = true;

  Future<void> _refreshData() async{
    await Future.delayed(Duration(microseconds: 500));
    setState(() {
      personalNote.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: keepDrawer,
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        iconTheme: theme.iconTheme,
        titleSpacing: 0,
        title: Text("Personal Note",
          style: theme.textTheme.bodyLarge?.copyWith(fontSize: 20),
        ),
      actions: [
        IconButton(onPressed: () {
        setState(() {
          isGrid = !isGrid;
        });
      }, icon: isGrid ? Icon(Icons.grid_view): Icon(Icons.list),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: widget.onToggleTheme,  icon: Icon(Icons.brightness_6)) ,
        )
        
        ],
    ),

      body: RefreshIndicator(
          onRefresh: _refreshData,
          child: isGrid ? buildGridView() : buildListView()),
      floatingActionButton: FloatingActionButton(onPressed: () {

      },
        child: Icon(Icons.add),

      ),

    );
  }
  
  Widget buildListView(){
    return ListView.builder(
      itemCount: personalNote.length,
      itemBuilder: (context, index) {
        final notes = personalNote[index];
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
          ),
          margin: EdgeInsets.all(5),
          child: ListTile(
            leading: Icon(Icons.label,color: Colors.blueGrey,),
            title: Text(notes.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
            subtitle: Text(notes.subtitle,style: TextStyle(color: Colors.grey),),
          ),
        );
      
    },);
  }
  
  Widget buildGridView(){
    return MasonryGridView.count(
      itemCount: personalNote.length,
      crossAxisCount: 2,
      itemBuilder: (context, index) {
        final gridNotes = personalNote[index];
      return  Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)
        ),
        margin: EdgeInsets.all(5),
        child: ListTile(
          title: Text(gridNotes.title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
          subtitle: Text(gridNotes.subtitle,style: TextStyle(color: Colors.grey),),
        ),
      );
    },);
  }
  
}
