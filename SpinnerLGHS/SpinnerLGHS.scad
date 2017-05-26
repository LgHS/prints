/* [Parametres generaux] */
// Nombre de cles
cleNB = 3;

/* [Parametres des manches] */
// Epaisseur des manches
manchesEP = 5;
// Longueur des manches
manchesLG = 60;
// Profondeur des manches
manchesPF = 15;

/* [Parametres des tetes] */
// Diametre des tetes
tetesDM = 20;
// Epaisseur des tetes
tetesEP = 7;

/* [Parametres des trous] */
// Diametres des trous
trousDM = 18;
// Decalage des trous
trousDC = 3;
// Nombres de faces des trous
trousFC = 6;

/* [Parametres du roulement] */
// Hauteur du roulement
rouleHT = 7;
//Diametre du roulement
rouleDM = 22;

use <logoLGHSCercle.scad>

fudge = 0.1;

hyp = tetesDM/2;
cote1 = manchesPF/2;
cote2 = sqrt(hyp*hyp-cote1*cote1)+manchesLG/2;

color("black")
difference ()
{
    union ()
    {
        for (i = [0:1:cleNB-1])
        {
            echo(i);
            rotate([0,0,180/cleNB*i])
            difference ()
            {
                union ()
                {
                    cube([manchesLG, manchesPF, manchesEP], center=true);
                
                    translate([cote2, 0,0])
                    cylinder(d=tetesDM, h=tetesEP, center=true);
                    
                    translate([-cote2, 0,0])
                    cylinder(d=tetesDM, h=tetesEP, center=true);
                }
                
                translate([cote2+trousDC,0,0])
                cylinder(d=trousDM, h=tetesEP+fudge, center=true, $fn=trousFC);
                
                translate([-cote2-trousDC,0,0])
                cylinder(d=trousDM, h=tetesEP+fudge, center=true, $fn=trousFC);
            }
        }
    }
    cylinder(d=rouleDM, h=rouleHT, center=true);
}
color("white")
translate([0,0,manchesEP/2])
scale ([0.2,0.2,0.2])
logolghs();