module tube_profile_X(x, y, z, longueur, epaisseur_bloc = 3, largeur_bloc = 6, largeur_profile = 20)
{
    ecart = (largeur_profile - largeur_bloc)/2;
    
    translate([x-1,y,z])
    #cube([longueur+2,ecart,ecart]);
    
    translate([x-1,y+ecart+largeur_bloc,z])
    #cube([longueur+2,ecart,ecart]);
    
    translate([x-1,y,z+ecart+largeur_bloc])
    #cube([longueur+2,ecart,ecart]);
    
    translate([x-1,y+ecart+largeur_bloc,z+ecart+largeur_bloc])
    #cube([longueur+2,ecart,ecart]);
    
    translate([x-1,y+epaisseur_bloc,z+epaisseur_bloc])
    #cube([longueur+2,largeur_profile-2*epaisseur_bloc,largeur_profile-2*epaisseur_bloc]);
}

module tube_profile_Y(x, y, z, longueur, epaisseur_bloc = 3, largeur_bloc = 6, largeur_profile = 20)
{
    ecart = (largeur_profile - largeur_bloc)/2;

    translate([x,y-1,z])
    #cube([ecart,longueur+2,ecart]);
    
    translate([x+ecart+largeur_bloc,y-1,z])
    #cube([ecart,longueur+2,ecart]);
    
    translate([x,y-1,z+ecart+largeur_bloc])
    #cube([ecart,longueur+2,ecart]);
    
    translate([x+ecart+largeur_bloc,y-1,z+ecart+largeur_bloc])
    #cube([ecart,longueur+2,ecart]);
    
    translate([x+epaisseur_bloc,y-1,z+epaisseur_bloc])
    #cube([largeur_profile-2*epaisseur_bloc,longueur+2,largeur_profile-2*epaisseur_bloc]);
}

module tube_profile_Z(x, y, z, longueur, epaisseur = 3, epaisseur_bloc = 3, largeur_bloc = 6, largeur_profile = 20)
{
    ecart = (largeur_profile - largeur_bloc)/2;

    translate([x,y,z-1])
    #cube([ecart,ecart,longueur+2]);
    
    translate([x,y+ecart+largeur_bloc,z-1])
    #cube([ecart,ecart,longueur+2]);
    
    translate([x+ecart+largeur_bloc,y,z-1])
    #cube([ecart,ecart,longueur+2]);
    
    translate([x+ecart+largeur_bloc,y+ecart+largeur_bloc,z-1])
    #cube([ecart,ecart,longueur+2]);
    
    translate([x+epaisseur_bloc,y+epaisseur_bloc,z-1])
    #cube([largeur_profile-2*epaisseur_bloc,largeur_profile-2*epaisseur_bloc,longueur+2]);
}