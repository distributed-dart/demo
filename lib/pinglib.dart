int timestamp() => new DateTime.now().millisecondsSinceEpoch;
Map pong(ts) => {'cmd' : 'pong', 'ts' : ts};
Map ping() => {'cmd' : 'ping', 'ts' : timestamp()};
Map sendping(to) => { 'cmd': 'sendping', 'sendto' :to };
