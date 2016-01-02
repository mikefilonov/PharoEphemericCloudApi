json-api
getEphemerics

	|response|
	response := self httpClient
			get;
			response.
			
	response isError ifTrue: [ Error signal: response statusLine reason ].
		
	^NeoJSONReader fromString: response contents
	