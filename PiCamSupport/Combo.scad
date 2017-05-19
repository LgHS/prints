/***********************************/
/*                                 */
/* Combo                           */
/*                                 */
/***********************************/

use <SupportBas.scad>
use <SupportCentral.scad>
use <SupportHaut.scad>

include <Config.scad>

/* [Paroi] */
// Hauteur de la paroi
paroiHT = 1000;
// Longueur de la paroi
paroiLG = 1000;
// Epaisseur de la paroi
paroiEP = 15;

/* [Fente] */
// Hauteur maximale de la fente
fenteHT = 195;
// Largeur de la fente
fenteLG = 35;
// Ecart entre la fente et le rebord
ecart = 10;

module decor()
{
    // Decor
    // -------
    %union ()
    {
        translate([0,-paroiEP/2,fenteHT/2+ecart+rebortHT])
        difference ()
        {
            // Paroi
            cube([paroiLG, paroiEP, paroiLG], center=true);

            // Fente
            translate([0,0,0])
            union ()
            {
                cube([fenteLG, paroiEP+2*fudge, fenteHT-fenteLG], center=true);
                
                translate([0,0,(fenteHT-fenteLG)/2])
                rotate([90,0,0])
                cylinder(d=fenteLG, h=paroiEP+2*fudge, center=true);
                
                translate([0,0,-(fenteHT-fenteLG)/2])
                rotate([90,0,0])
                cylinder(d=fenteLG, h=paroiEP+2*fudge, center=true);
            }
        }
        
        // Rebord
        translate([0,rebortEP/2,rebortHT/2])
        cube([paroiLG, rebortEP, rebortHT], center=true);
    }
}

decor();

translate([0,0,0])
{
    supportBas();
    supportCentral();
    supportHaut();
}
