import 'package:ecommerce_app/controllers/auth_service.dart';
import 'package:ecommerce_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Profile", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),),
    body: Column(children: [
      Consumer<UserProvider>(
        builder: (context, value, child)=>
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(title: Text(value.name),
            subtitle: Text(value.email),
            onTap: (){
              Navigator.pushNamed(context, "/update_profile");
            },
            trailing: Icon(Icons.edit_outlined),
            ),
          ),
        ),
      ),
      SizedBox(height: 20,),

      Divider(thickness: 1, endIndent: 10, indent: 10,),
      ListTile(title: Text("Orders"),leading: Icon(Icons.local_shipping_outlined),onTap: () async{

        } ,),
      Divider(thickness: 1, endIndent: 10, indent: 10,),
      ListTile(title: Text("Discount & Offers"),leading: Icon(Icons.discord_outlined),onTap: () async{
       
       } ,),
      Divider(thickness: 1, endIndent: 10, indent: 10,),
      ListTile(title: Text("Help & Support"),leading: Icon(Icons.support_agent),onTap: () async{
       
       } ,),
      Divider(thickness: 1, endIndent: 10, indent: 10,),
      ListTile(title: Text("Logout"),leading: Icon(Icons.logout_outlined),onTap: () async{
       await AuthService().logout();
       Navigator.pushNamedAndRemoveUntil(context, "/login", (route)=> true);
      } ,)
    ],),
    );
  
  }
}