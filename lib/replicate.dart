import 'dart:isolate';
import 'dart:async';
import 'dart:math';

main(){
  Random r = new Random();
  port.receive((msg,reply) {
      var name = msg['current'];

      // spawn new isolate and add to list
      var newid  = "${name}_${msg['value']++}";
      var new_isolate = spawnUri('replicate.dart');
      msg[newid] = new_isolate;

      // remove current isolate from list
      msg.remove(name);

      // pick next
      List keys = msg.keys.toList()..remove('value')..remove('current');
      String next = keys[r.nextInt(keys.length)];
      SendPort _port = msg[next];
      msg['current'] = next;

      print("$name: spawning $newid, next  is: $next");
      _port.send(msg);
    });
}
