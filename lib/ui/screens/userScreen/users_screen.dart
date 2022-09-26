import 'package:flutter/material.dart';
import '../../../models/card_info.dart';
import '../../../models/user.dart';
import '../../components/card.dart';
import '../../../repos/users.dart';

class UserScreen extends StatefulWidget {
  String token;
  UserScreen({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Future<List<User>> _userData;

  @override
  void initState() {
    super.initState();
    _userData = Users().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      body: _getUserGrid(),
    );
  }

  Widget _getUserGrid() {
    return FutureBuilder<List<User>>(
      future: _userData,
      builder: (context, snapshote) {
        if (snapshote.hasData) {
          return GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              snapshote.data!.length,
              (i) => CardComponents(
                cardInfo: CardInfoModel(
                  title: snapshote.data![i].firstName,
                  subtitle: snapshote.data![i].lastName,
                  image: snapshote.data![i].img,
                ),
              ),
            ),
          );
        } else if (snapshote.hasError) {
          return Center(
            child: Text('${snapshote.hasError}'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

// GridView.count(
// crossAxisCount: 2,
// children: [],
// );
