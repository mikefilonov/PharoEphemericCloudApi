json-api
userEndPointUrl
	^self class endPointUrl 
		addPathSegment: self userID;
		yourself