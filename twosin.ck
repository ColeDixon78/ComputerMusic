SinOsc s1 => Gain mix => JCRev rev => dac;
SinOsc s2 => mix;
SinOsc s3 => mix;
SinOsc s4 => mix;
SinOsc s5 => mix;
0.5 => rev.mix;
0.2 => mix.gain;
220 => s1.freq;
440 => s2.freq;
225 => s3.freq;
450 => s4.freq;
230 => s5.freq;
10.0 :: second => now;