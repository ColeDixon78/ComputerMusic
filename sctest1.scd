(
z = {
	arg noiseHz = 8;
	var freq, sig;
	freq = LFNoise0.kr(noiseHz).exprange(200,1000);
	sig = WhiteNoise.ar(0.25)*SinOsc.kr(SinOsc.kr(4));
	sig = sig + Saw.ar(SinOsc.kr(3)+freq)}.play;
)

z.set(\noiseHz, 64);
z.free
(
SynthDef.new(\test,{
	arg noiseHz = 8;
	var freq, sig;
	freq = LFNoise0.kr(noiseHz).exprange(200,1000);
	sig = WhiteNoise.ar(0.25)*SinOsc.kr(SinOsc.kr(4));
	sig = sig + Saw.ar(SinOsc.kr(3)+freq);
	Out.ar(0,sig);
}).add;
)

x = Synth.new(\test,[\noiseHz,64]);
