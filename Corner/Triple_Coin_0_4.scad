use <modules_coin_0_4.scad>

/* [Arms] */
// Length of the arms
armsL = 30.0;
// Width of the arms
armsW = 26.0;

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

union()
{
    color("green")
    cube(armsL);
    
    tube_profile(armsL, ArmsW, epaisseur_bloc, longueur_bloc, largeur_profile);
  
    difference()
    {
        color("blue")
        translate([0,largeur_tube,0])
        cube([largeur_tube,longueur_tube,largeur_tube]);
    
        color("red")
        translate([largeur_tube-epaisseur_tube,largeur_tube,epaisseur_tube])
        rotate([0,0,90])
        tube_profile(longueur_tube+1, epaisseur_bloc, epaisseur_bloc, largeur_profile);
    }
    
    difference()
    {
        color("blue")
        translate([0,0,largeur_tube])
        cube([largeur_tube,largeur_tube,longueur_tube]);
        
        color("red")
        translate([largeur_tube-epaisseur_tube,epaisseur_tube,largeur_tube])
        rotate([0,-90,0])
        tube_profile(longueur_tube+1, epaisseur_bloc, epaisseur_bloc, largeur_profile);
    }
}