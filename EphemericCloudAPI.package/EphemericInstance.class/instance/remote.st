remote debug
remote
	|hostport url |
	self isRunning ifFalse: [ self isRunning: true ].
	self reload.
	hostport := self mappedPorts at: self debugPort asString. "JSON properties always strings"
	url := ZnUrl fromString: hostport defaultScheme: #tcp.
	
	^PrmRemoteIDE connectTo: (TCPAddress ip: (NetNameResolver addressFromString: url host) port: url port).