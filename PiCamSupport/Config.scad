/***********************************/
/*                                 */
/* Configuration                   */
/*                                 */
/***********************************/

/* [Axe des trous] */
// Ecart par rapport a la face avant
ecartAxe = 40;
// Ecart entre le trou filete et les deux trous lisses
ecartTrous = 25;

/* [Trou filete] */
// Diametre du trou filete
fileteDM = 8;
// Profondeur du trou filete
filetePF = 20;

/* [Trou lisses] */
// Diametre des trous lisses
lissesDM = 5;
// Profondeur des trous lisses
lissesPF = 20;

/* [Dimensions du rebort] */
// Hauteur du rebort
rebortHT = 10;
// Epaisseur du rebort
rebortEP = 20;

/* [Dimensions des cylindres] */
// Hauteur des cylindres
cylindresHT = 20;
// Epaisseur des cylindres
cylindresEP = 3;

fudge = 0.1;
$fn = 50;

module cylindre(diametreInt, ep, ht)
{
    translate([0,0, ht/2])
    difference ()
    {
        cylinder(d=diametreInt+ep, h=ht, center=true);
        
        cylinder(d=diametreInt, h=ht+2*fudge, center=true);
    }
}

// cylindre(fileteDM, cylindresEP, cylindresHT);