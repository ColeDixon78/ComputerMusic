s.plotTree;

(
x = {
	var sig, env, freq;
	env = XLine.kr(1,0.1,5,doneAction: 2);
	freq = XLine.kr(880,110,10,doneAction:0);
	sig = Pulse.ar(freq)*env;
}.play;
)

x.free;
s.freeAll;