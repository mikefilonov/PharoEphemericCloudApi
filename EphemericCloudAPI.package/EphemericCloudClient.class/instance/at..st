json-api
at: hostname
	|response|
	response := self httpClient
			addPathSegment: hostname;
			get;
			response.
			
	response isError ifTrue: [ Error signal: response statusLine reason ].
		
	^NeoJSONReader fromString: response contents