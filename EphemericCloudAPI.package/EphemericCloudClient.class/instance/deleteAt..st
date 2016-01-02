json-api
deleteAt: hostname
	|response|
	response := self httpClient
			addPathSegment: hostname;
			delete;
			response.
			
	response isError ifTrue: [ Error signal: response statusLine reason ].
		
	^NeoJSONReader fromString: response contents