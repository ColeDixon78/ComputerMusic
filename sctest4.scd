(
SynthDef.new(\pulseTest,{
	arg fund = 40, maxPartial = 4;
	var amp1, amp2, freq1, freq2, sig1, sig2;
	amp1 = LFPulse.kr(12,0,0.12)*0.75;
	amp2 = LFPulse.kr(12,0.5,0.12)*0.75;
	freq1 = LFNoise0.kr(24).exprange(fund,fund*maxPartial).round(fund);
	freq2 = LFNoise0.kr(24).exprange(fund,fund*maxPartial).round(fund);
	freq1 = freq1 * LFPulse.kr(8,add:1);
	freq2 = freq2 * LFPulse.kr(6,add:1);
	sig1 = Pulse.ar(freq1,0,5,amp1);
	sig1 = Pulse.ar(freq2,0.5,amp2);
	sig1 = FreeVerb.ar(sig1,0.7,0.8,0.25);
	sig2 = FreeVerb.ar(sig1,0.7,0.8,0.25);
	Out.ar(0,sig1);
	Out.ar(1,sig2);
}).add;
)

x = Synth.new(\pulseTest);

