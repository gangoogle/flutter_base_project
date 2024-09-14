import 'package:objectbox/objectbox.dart';
import 'package:first_project/objectbox.g.dart';

@Entity()
class User {
  @Id()
  int id = 0;
  String? text;
  String? name;
  String? comment;
}
