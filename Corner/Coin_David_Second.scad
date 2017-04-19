use <modules_coin_0_4.scad>

/* [Corner] */
// Number of arcs passing throught
nbArc = 4;

/* [Tips] */
// Length of the tips
tipsL = 30.0;  // [1,2,3,4,5,6,7,8,9,30]
// Width of the tips
tipsW = 26.0;

/* [Profiles] */
// Width of the profiles
profilesW = 20.2;

/* [Blocs] */
// Length of the blocs
blocsL = 6;
// Width of the blocs
blocsW = 3;

/* [Hidden] */

// to avoid "z fighting" where surfaces line up exactly, add a bit of fudge
fudge = 0.1;


union()
{
    color("yellow")
    cube([tipsW, tipsW, tipsW]);

    translate([tipsW, 0, 0])
    tip_profile(tipsL, tipsW, profilesW, blocsL, blocsW, fudge);

    translate([tipsW, 0, tipsW])
    rotate([0,-90,0])
    tip_profile(tipsL, tipsW, profilesW, blocsL, blocsW, fudge);

    for (i = [1:1:nbArc])
    {
        translate([0, i*tipsW, 0])
        tip_profile(tipsW, tipsW, profilesW, blocsL, blocsW, fudge);
    }
}