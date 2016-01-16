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
		ZnConstants maximumEntitySize: 50*1024*1024.
		self publishZip: imageName,'.zip' named:  imageName].

	^isNew