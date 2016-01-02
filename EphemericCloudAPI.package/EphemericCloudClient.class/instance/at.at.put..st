json-api
at: hostname at: symbol put: anObject
	|response|
	
	response := self httpClient
			addPathSegment: hostname; addPathSegment: symbol;
			entity:((ZnStringEntity type: ZnMimeType applicationJson) string: (NeoJSONWriter toString: anObject); yourself);
			put;
			response.

	response isError ifTrue: [ Error signal: response statusLine reason ].
	^NeoJSONReader fromString: response contents
		