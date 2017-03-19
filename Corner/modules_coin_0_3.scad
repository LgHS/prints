module tube_profile(longueur, epaisseur_bloc = 3, largeur_bloc = 6, largeur_profile = 20)
{
    ecart = (largeur_profile - largeur_bloc)/2;

    translate([-1,0,0])
    #cube([longueur+2,ecart,ecart]);
    
    translate([-1,ecart+largeur_bloc,0])
    #cube([longueur+2,ecart,ecart]);
    
    translate([-1,0,ecart+largeur_bloc])
    #cube([longueur+2,ecart,ecart]);
    
    translate([-1,ecart+largeur_bloc,ecart+largeur_bloc])
    #cube([longueur+2,ecart,ecart]);
    
    translate([-1,epaisseur_bloc,epaisseur_bloc])
    #cube([longueur+2,largeur_profile-2*epaisseur_bloc,largeur_profile-2*epaisseur_bloc]);
}
