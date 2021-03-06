import 'package:distributed_dart/distributed_dart.dart';
import 'dart:io';
import 'dart:isolate';

List _argv = new Options().arguments;
String get _host => _argv[0];
int get _port => int.parse(_argv[1],radix:10);

main(){
  var master = new NodeAddress(_host, _port);
  registerNode(master, true);
  
  String program = 'packages/demo/passtheport.dart';
  var a = spawnUriRemote(program, new NodeAddress('localhost',2000));
  var b = spawnUriRemote(program, new NodeAddress('localhost',3000));
  var c = spawnUriRemote(program, new NodeAddress('localhost',4000));
  var d = spawnUri(program);
  
  var data = {'a': a, 'b': b, 'c' : c, 'd' : d, 'value' : 0, 'current': 'a'};
  a.send(data);
}
