Env.new.plot;
(
x = {
	arg t_gate = 0;
	var sig, env;
	env = EnvGen.kr(Env.new(
		[0,1,0.2,0],
		[0.5,1,2],
		[3,-3,0]),t_gate,
		doneAction: 2);
	sig = Pulse.ar(LFPulse.kr(8).range(600,900)) * env;
}.play;
)

x.set(\t_gate, 1);

Env.new([0,1,0.2,0],[0.5,1,2,2.5],[\sine,\sine,0,\sine]).plot
