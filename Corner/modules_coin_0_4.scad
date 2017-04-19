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

module void_profile(
    length,         // Length of the profile
    width = 20,     // Width of the profile
    blocL = 6,      // Lenght of the bloc
    blocW = 3,      // Width of the bloc
    fudge = 0.1)    // 
{
    step = (width - blocL)/2;
    
    // Bottom-left hole
    translate([-fudge,0,0])             
    cube([length+2*fudge,step,step]);

    // Bottom-rigth hole
    translate([-fudge,step+blocL,0])    
    cube([length+2*fudge,step,step]);

    // Top-left hole
    translate([-fudge,0,step+blocL])
    cube([length+2*fudge,step,step]);

    // Top-rigth hole
    translate([-fudge,step+blocL,step+blocL])
    cube([length+2*fudge,step,step]);

    // Middle hole
    translate([-fudge,blocW,blocW])
    cube([length+2*fudge,width-2*blocW,width-2*blocW]);
}

module tip_profile(
    tipL,           // Length of the tip
    tipW,           // Width of the tip
    profileW,       // Width of the profile
    blocL,          // Length of the bloc
    blocW,          // Width of the bloc
    fudge=0.1)        // 
{
    difference()
    {
        // The tip
        color("blue")
        cube([tipL, tipW, tipW]);
        
        color("red")
        translate([0, (tipW-profileW)/2, (tipW-profileW)/2])
        void_profile(tipL+fudge, profileW, blocL, blocW, fudge);
    }
}

union()
{
    //color("green")
    //cube(tipsW);

    //translate([tipsW, 0, 0])
    tip_profile(tipsL, tipsW, profilesW, blocsL, blocsW, fudge);
}