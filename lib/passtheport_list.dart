/**
  * receive a list of sendport, 
  * move first element to end of list, and send the modified list to the first
  */
import 'dart:isolate';
import 'dart:async';
import 'dart:math';

main(){
  int i = 0;
  Random r = new Random();
  port.receive((msg,reply) {
      var next = msg[0];
      var rest = msg.sublist(1);
      rest.add(next);
      print("${i++}");
      next.send(rest);
    });
}
