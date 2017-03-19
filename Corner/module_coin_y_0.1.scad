$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

module tube_profile_Y(x, y, z, longueur, epaisseur = 3, epaisseur_bloc = 3, largeur_bloc = 6, largeur_profile = 20)
{
    ecart = (largeur_profile - largeur_bloc)/2;
    
    difference()
    {
        translate([x,y,z])
        cube([largeur_profile+2*epaisseur, longueur, largeur_profile+2*epaisseur]);
        
        translate([x+epaisseur,y-1,z+epaisseur])
        #cube([ecart,longueur+2,ecart]);
        
        translate([x+epaisseur+ecart+largeur_bloc,y-1,z+epaisseur])
        #cube([ecart,longueur+2,ecart]);
        
        translate([x+epaisseur,y-1,z+epaisseur+ecart+largeur_bloc])
        #cube([ecart,longueur+2,ecart]);
        
        translate([x+epaisseur+ecart+largeur_bloc,y-1,z+epaisseur+ecart+largeur_bloc])
        #cube([ecart,longueur+2,ecart]);
        
        translate([x+epaisseur+epaisseur_bloc,y-1,z+epaisseur+epaisseur_bloc])
        #cube([largeur_profile-2*epaisseur_bloc,longueur+2,largeur_profile-2*epaisseur_bloc]);
    }
}
tube_profile_Y(0,0,0,50);
tube_profile_Y(x=30,y=0,z=30,longueur=50,epaisseur=4,epaisseur_bloc=2,largeur_bloc=8,largeur_profile=26);