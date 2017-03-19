module tube_profile_X(
    x = 0, 
    y = 0, 
    z = 0,
    longueur_tube = 40,
    largeur_tube = 26,
    epaisseur_bloc = 3,
    largeur_bloc = 6,
    largeur_profile = 21,
    couleur_tube = "blue")
{
    epaisseur_tube = (largeur_tube-largeur_profile)/2;
    
    difference()
    {
        color(couleur_tube)
        translate([x,y,z])
        cube([longueur_tube, largeur_tube, largeur_tube]);
        
        translate([x,y+epaisseur_tube,z+epaisseur_tube])
        tube_profile(longueur_tube+1, epaisseur_bloc, largeur_bloc, largeur_profile);        
    }
}

module tube_profile(
    longueur, 
    epaisseur_bloc = 3, 
    largeur_bloc = 6, 
    largeur_profile = 20)
{
    ecart = (largeur_profile - largeur_bloc)/2;

    #translate([-1,0,0])
    cube([longueur+2,ecart,ecart]);
    
    #translate([-1,ecart+largeur_bloc,0])
    cube([longueur+2,ecart,ecart]);
    
    #translate([-1,0,ecart+largeur_bloc])
    cube([longueur+2,ecart,ecart]);
    
    #translate([-1,ecart+largeur_bloc,ecart+largeur_bloc])
    cube([longueur+2,ecart,ecart]);
    
    #translate([-1,epaisseur_bloc,epaisseur_bloc])
    cube([longueur+2,largeur_profile-2*epaisseur_bloc,largeur_profile-2*epaisseur_bloc]);
}
union()
{
color("green")
cube(26);

tube_profile_X(
    26,0,0,40, 26, 3, 6, 21);
}