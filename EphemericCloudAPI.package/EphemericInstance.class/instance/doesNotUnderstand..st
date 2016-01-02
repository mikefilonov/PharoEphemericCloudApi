proxy
doesNotUnderstand: aMessage
	aMessage selector isUnary ifTrue:[
		^ self jsonObject at: aMessage selector ifAbsent: [ super doesNotUnderstand: aMessage  ] ].
	
	aMessage selector isKeyword ifTrue:[
		|attribute|
		attribute := aMessage selector allButLast asSymbol.
		^ self at: attribute put: aMessage arguments first].
	
	^super doesNotUnderstand: aMessage 
	
