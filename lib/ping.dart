import 'dart:isolate';
import 'pinglib.dart';

main(){
  int c = 0;
  port.receive((msg, reply) {
    var now = timestamp();
    
    // received ping, reply pong with original timestamp
    if(msg['cmd'] == 'ping'){
      print("${c++}: ping");
      reply.send(pong(msg['ts']) ,port.toSendPort());
    }
    
    // received pong, calculate rtt, and reply new ping
    if(msg['cmd'] == 'pong'){
      var rtt = now - msg['ts'];
      print("${c++}: rtt ${rtt}ms");
      reply.send(ping(), port.toSendPort());
    } 
    
    // received a command to send ping to another host
    if (msg['cmd'] == 'sendping'){
      var sendport = msg['sendto'];
      sendport.send(ping(),port.toSendPort());
    }
  });
}
