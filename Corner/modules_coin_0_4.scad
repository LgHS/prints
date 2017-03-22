/* [Tips] */
// Length of the tips
tipsL = 30.0;  // [1,2,3,4,5,6,7,8,9,30]
// Width of the tips
tipsW = 26.0;

/* [Profiles] */
// Width of the profiles
profilesW = 21.0;

/* [Blocs] */
// Length of the blocs
blocsL = 6;
// Width of the blocs
blocsW = 3;

/* [Hidden] */
// Thickness of the arms
armsT = (armsW-profilesW)/2;

// to avoid "z fighting" where surfaces line up exactly, add a bit of fudge
fudge = .001;

module void_profile(
    length,         // Length of the profile
    width = 20,     // Width of the profile
    blocL = 6,      // Lenght of the bloc
    blocW = 3)      // Width of the bloc
{
    step = (width - blocW)/2;

    // Bottom-left hole
    translate([0,0,0])             
    cube([length,step,step]);
    
    // Bottom-rigth hole
    translate([0,step+blocW,0])    
    cube([length,step,step]);
    
    // Top-left hole
    translate([0,0,step+blocW])
    cube([length,step,step]);
    
    // Top-rigth hole
    translate([0,step+blocW,step+blocW])
    cube([length,step,step]);
    
    // Middle hole
    translate([0,blocW,blocW])
    cube([length,width-2*blocW,width-2*blocW]);
}

module tip_profile(
    tipL,           // Length of the tip
    tipW,           // Width of the tip
    profileW,       // Width of the profile
    blocL,          // Length of the bloc
    blocW,          // Width of the bloc
    fudge=1)        // 
{
    difference()
    {
        // The tip
        color("blue")
        cube([tipL, tipW, tipW]);
        
        color("red")
        translate([0, (tipW-profileW)/2, (tipW-profileW)/2])
        void_profile(tipL+fudge, profileW, blocL, blocW);
    }
}

union()
{
    color("green")
    cube(tipsW);

    translate([tipsW, 0, 0])
    tip_profile(tipsL, tipsW, profilesW, blocsL, blocsW);
}