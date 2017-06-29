json-api
publishZip: fileReference named: imageName withMaxSize: size
	ZnMaximumEntitySize value: size during: [ 
		self publishZip: fileReference named: imageName
		]