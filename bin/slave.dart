import 'package:distributed_dart/distributed_dart.dart';
import 'dart:io';

List _argv = new Options().arguments;
String get _host => _argv[0];
int get _port => int.parse(_argv[1],radix:10);

main(){
  var node = new NodeAddress(_host, _port);
  registerNode(node, true);
}
