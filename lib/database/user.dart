import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int id = 0;
  String? text;
  String? name;
  String? comment;
}
