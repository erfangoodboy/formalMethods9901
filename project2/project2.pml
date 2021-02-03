#define open 1
#define lowered 2
#define closed 3
#define raised 4
#define red 0
#define yellow 1
#define green 2
#define normal 1
#define low 2
#define stop 3
mtype = {msg, ack};
chan tosndr = [0] of {mtype, bit};
chan torcvr = [0] of {mtype, bit};
byte gate = open ; 
byte light = red ;
byte speed = stop;
active proctype sender() {
	bool seqout, seqin;
	do 
	:: (light == green) -> 
		gate = raised;
		torcvr!msg,seqout;
          		tosndr?ack,seqin;
		printf("raised");
		if 
		:: seqin == seqout ->
     			seqout = 1- seqout ;
		::else->skip;
		fi
	:: ( light == yellow &&  gate == lowered) -> 
		gate = closed;
		torcvr!msg,seqout;
          		tosndr?ack,seqin;
		printf("closed");
		if 
		:: seqin == seqout ->
     			seqout = 1- seqout ;
		::else->skip;
		fi
	::( light == yellow && gate == raised) -> 
		gate = open;
		torcvr!msg,seqout;
          		tosndr?ack,seqin;
		printf("opened");
		if 
		:: seqin == seqout ->
     			seqout = 1- seqout ;
		::else->skip;
		fi
	:: (light == red) ->
		gate = lowered;
		torcvr!msg,seqout;
          		tosndr?ack,seqin;
		printf("lowered");
		if 
		:: seqin == seqout ->
     			seqout = 1- seqout ;
		::else->skip;
		fi
		
	od
	
}

active proctype receiver() {
	bool seqin;
	do
	:: torcvr?msg,seqin ->
		if
		:: ( gate == open) -> 
			light = red;
			speed = stop;
			printf("light is red");
			tosndr!ack,seqin;
		:: (gate == lowered) -> 
			light = yellow;
			speed = low;
			printf("here");
			tosndr!ack,seqin;
		:: ( gate == closed) -> 
			light = green;
			speed = normal;
			printf("light is green");
			tosndr!ack,seqin;
		:: ( gate == raised) -> 
			light = yellow;
			speed = low;
			printf("light is yellow");
			tosndr!ack,seqin;
		fi	
	od
}










