/** spawn same program as a local isolate, and a distributed isolate
  * and make them talk together
  */
import 'package:distributed_dart/distributed_dart.dart';
import 'package:demo/pinglib.dart';
import 'dart:io';
import 'dart:isolate';

List _argv = new Options().arguments;
String get _host => _argv[0];
int get _port => int.parse(_argv[1],radix:10);

main(){
  var master = new NodeAddress(_host, _port);
  registerNode(master, true);

  String program = 'packages/demo/ping.dart';
  var local = spawnUri(program);
  var remote = spawnUriRemote(program, new NodeAddress('localhost',2000));
  
  remote.send(sendping(local));
}
