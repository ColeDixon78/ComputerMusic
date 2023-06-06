(
    var n = 24;
    {
        Mix.fill(n, { arg index;
            var freq;
            index.postln;
		    freq = 440 * ((index*2)+1);
            freq.postln;
		-1.exp(index) * SinOsc.ar(freq , 0, 1 / n)
        })
    }.play;
)

(
{
	var ampOsc1, ampOsc2;
	ampOsc1 = SinOsc.kr(0.5,0.5pi,0.5,0.5);
	ampOsc2 = SinOsc.kr(0.5,1.5pi,0.5,0.5);
	Mix([Saw.ar(440,ampOsc1,0),SinOsc.ar(440,0,ampOsc2,0)]);
}.play;
s.scope;
)
{SinOsc.ar(500,0,0.5).cubed}.scope;
(
// mix 3 unit generators.
    {
        Saw.ar(500, 0.05)    // receiver
        +            // operator
        Saw.ar(600, 0.06)    // operand
                        // when evaluated produce
                        // a BinaryOpUGen
                        // this BinaryOpUGen is then a receiver for an
        +                // addition operator followed by
        Saw.ar(700, 0.07)        // an operand
    }.scope;
)
{Mix.fill(3,{arg i;Saw.ar(500 + (100*i),0.3)})}.scope

{WhiteNoise.ar(1)*SinOsc.kr(1,1)}.scope;
(
    // scaling and mixing
    // ... imitates a train?
    {
        (WhiteNoise.ar(0.5) * SinOsc.kr(1, 1))
        +
        (BrownNoise.ar(0.5) * SinOsc.kr(2, 1))

    }.scope;
)
{ SinOsc.ar(440, 0, 0.1) * EnvGen.kr(Env.sine(1), doneAction: Done.freeSelf) }.scope;

(
SynthDef("timeScale", { arg ts = 1;
    Out.ar(
        0,
        SinOsc.ar(440, 0, 0.4)
        *
        EnvGen.kr(
            Env.sine(1),
            doneAction: Done.freeSelf,
            timeScale: ts    // scale the duration of an envelope
        )
    )
}).add;
)
Synth("timeScale", [\ts, 0.1]);
(
r = Routine({
    loop({
        Synth("timeScale", [\ts, 0.01.rrand(0.3)]);
        0.5.wait;
    })
});
)
r.play
(
{    // evaluate the function 12 times
    var n = 12;
    Mix.arFill(
        n,
        {
            SinOsc.ar(
                [67.0.rrand(2000), 67.0.rrand(2000)],
                0,
                n.reciprocal * 0.75
            )
        }
    )
    *
    EnvGen.kr(Env.perc(11, 6), doneAction: Done.freeSelf)
}.scope
)
(
{    var n = 12;

    Mix.arFill(
            n,                        // generate n sine waves
            {
            SinOsc.ar(                    // each with a possible frequency between
                [67.0.rrand(2000), 67.0.rrand(2000)],    // low.rrand(high) ... floating point values
                0,
                n.reciprocal                // scale the amplitude of each sine wave
                                    // according to the value of n
            )
            *
            EnvGen.kr(                    // put an envelope on each of the sine waves
                Env.sine(2.0.rrand(17)),
                doneAction: Done.none                 // deallocate envelopes only when the
                                    // entire sound is complete (why?)
            )
        }
    )
    *                                // put an envelope over the whole patch
    EnvGen.kr(
        Env.perc(11, 6),
        doneAction: Done.freeSelf,
        levelScale: 0.75
    )

}.scope
)
{ SinOsc.ar(440, 0, 0.571) * SinOsc.kr(880) }.scope

// use an lfo to modulate the amplitude of the modulator
(
    {
        SinOsc.ar(440, 0, 0.571)
        *
        (SinOsc.kr(880).abs                // wrap the modulator and the lfo in parenthese
        *                     // why ... ?
        SinOsc.kr([6.99, 8.01].reciprocal)
        )
    }.scope
)