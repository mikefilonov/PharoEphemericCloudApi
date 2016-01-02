object-api
all
	^(self getEphemerics at: 'ephemerics') collect: [ :json | self createEphemericInstanceOn: json ]