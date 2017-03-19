module tube_profile_X(x, y, z, longueur, epaisseur = 3, epaisseur_bloc = 3, largeur_bloc = 6, largeur_profile = 20)
{
    ecart = (largeur_profile - largeur_bloc)/2;
    
    difference()
    {
        translate([x,y,z])
        cube([longueur, largeur_profile+2*epaisseur, largeur_profile+2*epaisseur]);
        
        translate([x-1,y+epaisseur,z+epaisseur])
        #cube([longueur+2,ecart,ecart]);
        
        translate([x-1,y+epaisseur+ecart+largeur_bloc,z+epaisseur])
        #cube([longueur+2,ecart,ecart]);
        
        translate([x-1,y+epaisseur,z+epaisseur+ecart+largeur_bloc])
        #cube([longueur+2,ecart,ecart]);
        
        translate([x-1,y+epaisseur+ecart+largeur_bloc,z+epaisseur+ecart+largeur_bloc])
        #cube([longueur+2,ecart,ecart]);
        
        translate([x-1,y+epaisseur+epaisseur_bloc,z+epaisseur+epaisseur_bloc])
        #cube([longueur+2,largeur_profile-2*epaisseur_bloc,largeur_profile-2*epaisseur_bloc]);
    }
}

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