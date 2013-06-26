/** spawn same program as a local isolate, and a distributed isolate
  * and make them talk together
  */
import 'package:distributed_dart/distributed_dart.dart';
import 'dart:io';
import 'dart:isolate';

List _argv = new Options().arguments;
String get _host => _argv[0];
int get _port => int.parse(_argv[1],radix:10);

main(){
  var master = new NodeAddress(_host, _port);
  registerNode(master, true);
  String program = 'packages/demo/passtheport_list.dart';
  var a = spawnUriRemote(program, new NodeAddress('localhost',2000));
  var b = spawnUriRemote(program, new NodeAddress('localhost',3000));
  var c = spawnUri(program);
  var d = spawnUriRemote(program, new NodeAddress('localhost',4000));
//  var data = {'a': a, 'b': b, 'c' : c, 'd' : d, 'value' : 0};

  var data = [ a,b,c,d];
  a.send(data);
}
