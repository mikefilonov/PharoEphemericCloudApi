object-api
createEphemericInstanceOn: json
	^ EphemericInstance new
			client: self;
			jsonObject: json;
			yourself