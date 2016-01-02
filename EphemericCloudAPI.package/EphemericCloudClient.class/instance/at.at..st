json-api
at: hostname at: attribute
	|response|
	response := self httpClient
			addPathSegment: hostname; addPathSegment: attribute;
			get;
			response.
			
	response isError ifTrue: [ Error signal: response statusLine reason ].
		
	^NeoJSONReader fromString: response contents