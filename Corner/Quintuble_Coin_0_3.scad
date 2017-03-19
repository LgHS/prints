include <modules_coin_0_3.scad>

longueur_tube = 40;
largeur_tube = 26;
largeur_profile = 21;

epaisseur_bloc = 3;
longueur_bloc = 6;

epaisseur_tube = (largeur_tube-largeur_profile)/2;

union()
{
    color("green")
    cube([largeur_tube, largeur_tube, largeur_tube*3]);

    difference ()
    {
        color("blue")
        translate([largeur_tube,0,0])
        cube([longueur_tube,largeur_tube,largeur_tube]);

        color("red")
        translate([largeur_tube,epaisseur_tube,epaisseur_tube])
        tube_profile(longueur_tube+1, epaisseur_bloc, epaisseur_bloc, largeur_profile);
    }

    difference ()
    {
        color("blue")
        translate([largeur_tube,0,largeur_tube*2])
        cube([longueur_tube,largeur_tube,largeur_tube]);
        
        color("red")
        translate([largeur_tube,epaisseur_tube,epaisseur_tube+largeur_tube*2])
        tube_profile(longueur_tube+1, epaisseur_bloc, epaisseur_bloc, largeur_profile);
    }

    difference ()
    {
        color("blue")
        translate([0,largeur_tube,0])
        cube([largeur_tube,longueur_tube,largeur_tube]);
        
        color("red")
        translate([largeur_tube-epaisseur_tube,largeur_tube,epaisseur_tube])
        rotate([0,0,90])
        tube_profile(longueur_tube+1, epaisseur_bloc, epaisseur_bloc, largeur_profile);
    }

    difference ()
    {
        color("blue")
        translate([0,largeur_tube,largeur_tube*2])
        cube([largeur_tube,longueur_tube,largeur_tube]);

        color("red")
        translate([largeur_tube-epaisseur_tube,largeur_tube,epaisseur_tube+largeur_tube*2])
        rotate([0,0,90])
        tube_profile(longueur_tube+1, epaisseur_bloc, epaisseur_bloc, largeur_profile);
    }

    difference ()
    {
        color("blue")
        translate([0,0,largeur_tube*3])
        cube([largeur_tube,largeur_tube,longueur_tube]);

        // tube_profile(3,3,78,41);
        color("red")
        translate([largeur_tube-epaisseur_tube,epaisseur_tube,largeur_tube*3])
        rotate([0,-90,0])
        tube_profile(longueur_tube+1, epaisseur_bloc, epaisseur_bloc, largeur_profile);
    }

    /*translate([26,0,78])
    color([0,0,1])
    polyhedron(
        // [        [0+26,0,0+78],[40+26,0,0+78],[0+26,0,40+78],
        //          [0+26,3,0+78],[40+26,3,0+78],[0+26,3,40+78]]

        points=[    [40,0,0],[40,3,0],[0,3,0],
                    [0,0,0],[0,0,40],[0,3,40]],
    
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
    
    translate([26,23,78])
    color([0,0,1])
    polyhedron(
        // [        [0+26,0,0+78],[40+26,0,0+78],[0+26,0,40+78],
        //          [0+26,3,0+78],[40+26,3,0+78],[0+26,3,40+78]]

        points=[    [40,0,0],[40,3,0],[0,3,0],
                    [0,0,0],[0,0,40],[0,3,40]],
    
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
    
    translate([3,26,78])
    rotate([0,0,90])
    color("orange")
    polyhedron(
        // [        [0+26,0,0+78],[40+26,0,0+78],[0+26,0,40+78],
        //          [0+26,3,0+78],[40+26,3,0+78],[0+26,3,40+78]]

        points=[    [40,0,0],[40,3,0],[0,3,0],
                    [0,0,0],[0,0,40],[0,3,40]],
    
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
    
    translate([26,26,78])
    rotate([0,0,90])
    color("black")
    polyhedron(
        // [        [0+26,0,0+78],[40+26,0,0+78],[0+26,0,40+78],
        //          [0+26,3,0+78],[40+26,3,0+78],[0+26,3,40+78]]

        points=[    [40,0,0],[40,3,0],[0,3,0],
                    [0,0,0],[0,0,40],[0,3,40]],
    
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );*/
}