include <modules_coin_0_4.scad>

longueur_tube = 30;
largeur_tube = 26;
largeur_profile = 21;

epaisseur_bloc = 3;
longueur_bloc = 6;

epaisseur_tube = (largeur_tube-largeur_profile)/2;

union()
{
    color("green")
    cube(largeur_tube);
    
    tube_profile_X(
        largeur_tube,0,0,longueur_tube, largeur_tube, epaisseur_bloc, longueur_bloc, largeur_profile);
  
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