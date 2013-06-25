import 'package:distributed_dart/distributed_dart.dart';
import 'dart:io';
import 'dart:isolate';

List _argv = new Options().arguments;
String get _host => _argv[0];
int get _port => int.parse(_argv[1],radix:10);

main(){
  var master = new NodeAddress(_host, _port);
  registerNode(master, true, _wd);

  //spawnUriRemote();
}
