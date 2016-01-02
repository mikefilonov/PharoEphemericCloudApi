json-api
httpClient
	^ZnClient new
		beOneShot;
		username: self userID password: self authToken;
		url: self userEndPointUrl;
		yourself
		