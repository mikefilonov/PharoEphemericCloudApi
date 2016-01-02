api
printOn: stream
	stream nextPutAll: self class asString; nextPutAll: '('; nextPutAll: self hostname; nextPutAll: ','; nextPutAll: self imageName; nextPutAll: ')'