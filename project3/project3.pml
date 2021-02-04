mtype = {  odd , enroll , enrolled , release , released } 
chan channel1 = [2] of {mtype , int};
chan channel2 = [2] of {mtype , int};
int second = 0;

proctype publisher(){

		int channelRecievedInt;
		do
		::(second % 2 ==1) -> 
			channel2 ! odd , 0;
			second++;
		/* saw an enroll req by sub */
		:: channel1 ? enroll , channelRecievedInt -> 
			/* confirmation to enroll a sub sent to channel 2*/
			channel2 ! enrolled , channelRecievedInt;
		/* saw release req by sub */
		:: channel1 ? release , channelRecievedInt -> 
			/* confirmation to release a sub sent to channel 2*/
			channel2 ! released , channelRecievedInt;
		od

}

proctype subscriber(int counter){
		/* is member -> 1 and isnot a member -> 0*/
		int exists = 0;
		int channelRecievedInt;
		do
		/* send a request to channel 1 for enrollment of sub by counter id*/
		:: channel1 ! enroll , counter -> 
			/* wait for channel 2 enrollment accepted*/
			channel2 ? enrolled , channelRecievedInt ;
			exists = 1;
		/* send a request to channel 1 for releasement of sub by counter id*/
		:: channel1 ! release , counter ->
			/* wait for channel 2 releasement accepted*/
			channel2 ? released , channelRecievedInt ;
			exists = 0;
		od

}

init {
	run publisher();
	int counter = 0;
	do
		::(counter < 3) ->
			run subscriber(counter);
			counter = counter + 1;
	od
}

ltl c3 { [](subscriber[1].id == 2) }

