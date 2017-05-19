/***********************************/
/*                                 */
/* Support du bas                  */
/*                                 */
/***********************************/

include <Config.scad>

/* [Dimensions du support] */
// Hauteur du support
supportHT = 30;
// Longueur du support
supportLG = 70;
// Epaisseur du support
supportEP = 5;


module supportBas()
{
    color("gold")
    union ()
    {
        translate([-supportLG/2,0,0])
        cube([supportLG,rebortEP+supportEP,supportEP]);
        
        
    }    
//    translate([-supportLG/2,0,0])
//    difference ()
//    {
//        // Support principal
//        cube([supportLG, supportEP, supportHT]);
//        
//        // Rebort
//        translate([-fudge,-fudge,-fudge])
//        cube([supportLG+2*fudge, rebortEP+fudge, rebortHT+fudge]);
//        
//        translate([supportLG/2,ecartAxe,supportHT])
//        {
//            // Trou filete
//            #color("red")
//            translate([0,0,-filetePF/2])
//            cylinder(d=fileteDM, h=filetePF+fudge, center=true);
//            
//            // Trou lisse de gauche
//            #color("green")
//            translate([-ecartTrous, 0, -lissesPF/2])
//            cylinder(d=lissesDM, h=lissesPF+fudge, center=true);
//            
//            // Trou lisse de droite
//            #color("blue")
//            translate([ecartTrous, 0, -lissesPF/2])
//            cylinder(d=lissesDM, h=lissesPF+fudge, center=true);
//        }
//    }
}

supportBas();