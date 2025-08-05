import 'package:flutter/material.dart';

var keepDrawer = Drawer(

  child: ListView(
    children: [
      Padding(padding: const EdgeInsets.only(left: 22),
        child: Text("Google Keep", style: TextStyle(color: Colors.grey),),
      ),
      SizedBox(height: 10,),

      ListTile(
        leading: Icon(Icons.lightbulb,color: Colors.grey,),
        title: Text("Notes",style: TextStyle(color: Colors.grey),),
      ),
      ListTile(
        leading: Icon(Icons.notifications_none,color: Colors.grey,),
        title: Text("Reminders",style: TextStyle(color: Colors.grey),),
      ),
      ListTile(
        leading: Icon(Icons.add,color: Colors.grey,),
        title: Text("Create new label",style: TextStyle(color: Colors.grey),),
      ),
      ListTile(
        leading: Icon(Icons.archive_outlined,color: Colors.grey,),
        title: Text("Archive",style: TextStyle(color: Colors.grey),),
      ),
      ListTile(
        leading: Icon(Icons.delete_forever_outlined,color: Colors.grey,),
        title: Text("Delete",style: TextStyle(color: Colors.grey),),
      ),
      ListTile(
        leading: Icon(Icons.settings_outlined,color: Colors.grey,),
        title: Text("Settings",style: TextStyle(color: Colors.grey),),
      ),
      ListTile(
        leading: Icon(Icons.help_outline,color: Colors.grey,),
        title: Text("Help & feedback",style: TextStyle(color: Colors.grey),),
      ),

    ],
  )
);