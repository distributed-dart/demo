/**
  * receive a list of sendport, 
  * move first element to end of list, and send the modified list to the first
  */
import 'dart:isolate';
main(){
  int i = 0;
  port.receive((msg,reply) {
      print(msg.runtimeType);
      // put the first port last
//      var first = msg[0];
//      var rest = msg.sublist(1);
//      rest.add(first);
//      print(rest);
//      new Timer(new Duration(seconds: 1), () => first.send(rest));
    });
}
