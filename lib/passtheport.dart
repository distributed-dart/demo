/**
  * receive a list of sendport, 
  * move first element to end of list, and send the modified list to the first
  */
import 'dart:isolate';
import 'dart:async';
import 'dart:math';

main(){
  Random r = new Random();
  port.receive((msg,reply) {
     // because we dont support sendport in list, yet 
      List keys = msg.keys.toList()..remove('value');
      String next = keys[r.nextInt(keys.length)];
      SendPort _port = msg[next];
      msg['value']++;

      print("${msg['value']}: next node is: $next");
      _port.send(msg)
    });
}
