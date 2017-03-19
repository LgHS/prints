$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

module tube_profile_Z(x, y, z, longueur, epaisseur = 3, epaisseur_bloc = 3, largeur_bloc = 6, largeur_profile = 20)
{
    ecart = (largeur_profile - largeur_bloc)/2;
    
    difference()
    {
        translate([x,y,z])
        cube([largeur_profile+2*epaisseur, largeur_profile+2*epaisseur, longueur]);
        
        translate([x+epaisseur,y+epaisseur,z-1])
        #cube([ecart,ecart,longueur+2]);
        
        translate([x+epaisseur,y+epaisseur+ecart+largeur_bloc,z-1])
        #cube([ecart,ecart,longueur+2]);
        
        translate([x+epaisseur+ecart+largeur_bloc,y+epaisseur,z-1])
        #cube([ecart,ecart,longueur+2]);
        
        translate([x+epaisseur+ecart+largeur_bloc,y+epaisseur+ecart+largeur_bloc,z-1])
        #cube([ecart,ecart,longueur+2]);
        
        translate([x+epaisseur+epaisseur_bloc,y+epaisseur+epaisseur_bloc,z-1])
        #cube([largeur_profile-2*epaisseur_bloc,largeur_profile-2*epaisseur_bloc,longueur+2]);
    }
}

tube_profile_Z(0,0,0,50);
tube_profile_Z(x=30,y=30,z=0,longueur=50,epaisseur=4,epaisseur_bloc=2,largeur_bloc=8,largeur_profile=26);