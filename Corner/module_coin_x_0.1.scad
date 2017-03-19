$fa=0.5; // default minimum facet angle is now 0.5
$fs=0.5; // default minimum facet size is now 0.5 mm

/*difference()
{
    cube([60,26,26]);
    
    translate([-1,3,3])
    #cube([62,7,7]);
    
    translate([-1,16,3])
    #cube([62,7,7]);
    
    translate([-1,3,16])
    #cube([62,7,7]);
    
    translate([-1,16,16])
    #cube([62,7,7]);
    
    translate([-1,5,5])
    #cube([62,16,16]);
}*/

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
tube_profile_X(0,0,0,50);
tube_profile_X(x=0,y=30,z=30,longueur=50,epaisseur=4,epaisseur_bloc=2,largeur_bloc=8,largeur_profile=26);