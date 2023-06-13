import 'package:flutter/material.dart';
import '../list_pasien/list_view_pasien.dart';
import './list_view_activity.dart';
import './user_model.dart';

class ItemUser extends StatelessWidget {
  final int index;
  final UserModel data;
  final void Function(UserModel) onClick;

  ItemUser(this.index, this.data, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0, left: 10, right: 10),
      child: ElevatedButton(
        child: InkWell(
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.lightBlue,
                child: Text(
                  data.codeName,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: Container(
                  height: 70,
                  margin: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0),
                        child: Text(
                          data.major,
                          style: TextStyle(
                            color: Color.fromARGB(255, 59, 59, 59),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => Pasien(),
          //   ),
          // );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          elevation: 0,
        ),
      ),
    );
  }
}
