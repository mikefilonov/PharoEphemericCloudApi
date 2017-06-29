json-api
publishSelfAs: imageName with: archiveBlock
	|isNew|
	isNew := Smalltalk backupTo: imageName.
	isNew ifFalse: [ "not in backup copy"
		|archive|
		archive := ZipArchive new
			addFile: imageName,'.image';
			addFile: imageName,'.changes';
			yourself.
		archiveBlock ifNotNil: [archiveBlock value: archive].
		archive writeToFileNamed: imageName,'.zip'.

		self publishZip: imageName,'.zip' named:  imageName withMaxSize: 60 * 1024 * 1024].

	^isNew