json-api
publishZip: fileReference named: imageName
	|response entity hostname|
	"Create HTTP multi-part post-query"
	entity := ZnMultiPartFormDataEntity new 
		addPart: (ZnMimePart 
			fieldName: 'imageZip'
			fileName: imageName
			entity: (ZnStreamingEntity 
				readBinaryFrom: fileReference asFileReference binaryReadStream 
				usingType: 'application/zip' asMIMEType 
				andLength: fileReference asFileReference size)); yourself.

	"Send the query, read output"
	response := self httpClient
			entity: entity;
			timeout: 60*1000;
			post;
			response.
			
	response isError ifTrue: [ Error signal: response statusLine reason ].
		
	hostname := NeoJSONReader fromString: response contents.
	self lastPublishedInstance: self / hostname.
	^ self lastPublishedInstance.