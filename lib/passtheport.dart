import 'dart:isolate';
import 'dart:async';
import 'dart:math';

main(){
  Random r = new Random();
  port.receive((msg,reply) {
    
      List keys = msg.keys.toList()..remove('value')..remove('current');
      String next = keys[r.nextInt(keys.length)];
      SendPort _port = msg[next];
      String name = msg['current'];
      
      msg['value']++;
      print("$name, ${msg['value']}: next node is: $next");
      _port.send(msg);
    });
}
