import 'package:flutter/material.dart';

MyDrawer(BuildContext context) {
  return Drawer(
      child: ListView(children: [
        SizedBox(
          height: 200,
          child: DrawerHeader(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              accountName: Text("context.read<UserService>().userModel.name!"),
              accountEmail: Text("context.read<UserService>().userModel.email!"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://yt3.ggpht.com/ytc/AMLnZu-miEt_Sh3H6s6zfKJaolUpb5tpPg0-UZet-Eujng=s900-c-k-c0x00ffffff-no-rj'),
              ),
            ),
          ),
        ),
        ListTile(title: Text("My Orders"), onTap: () => {}),
      ]));
}