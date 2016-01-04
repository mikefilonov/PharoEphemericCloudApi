publishing
publishSelfAs: imageName
	|isNew|
	isNew := Smalltalk backupTo: imageName.
	isNew 	ifFalse: [
		ZipArchive new
			addFile: imageName,'.image';
			addFile: imageName,'.changes';
			writeToFileNamed: imageName,'.zip'.
		(self publishZip: imageName,'.zip' named: imageName) inspect.					
		].
	^isNew
	

	

	