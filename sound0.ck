SawOsc s1 => Gain mix => BPF fil => JCRev r => dac;
[440,220,415,400,600,520,580,420] @=> int seq[];
0 @=> int i;
1 => fil.Q;
.7 => r.mix;
while(true){
    seq[i%8] => s1.freq;
    100 + Math.fabs(Math.sin(now/second)) * 5000 => fil.freq;
    .5 :: second => now;
    ++i;
}
