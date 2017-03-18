$fn = 6;

// Parametric design, allows to control what is printed exactly
printHalfPieces=false;
printAllPieces=true;
printFive=false;
printBoard=true;

module rook(height) {
    ht=height/60;
    // Base
    difference(){
        intersection(){
            translate([0,0,30*ht]) rotate([0,0,45]) cube([24*ht,24*ht,60*ht], center=true);
            translate([0,0,30*ht]) cube([20*ht,20*ht,60*ht], center=true);
        }
        // Crenels
        union(){
            translate([0,0,58.2*ht]) cube([30*ht,4*ht,4*ht],center=true);
            translate([0,0,58.2*ht]) cube([4*ht,30*ht,4*ht],center=true);
        }
    }
}
    


module pawn(height) {
    ht = height/60;
    union(){
        cylinder(h=30*ht,r2=6*ht, r1=14*ht);
        translate([0,0,28*ht]) scale([1.4,1.4,2.2]) rotate([45,45,45]) cube(10,10,10, center=true);
    }
}

module knight(height){
    ht=height/60;
    union(){
        // Base
        cylinder(h=30*ht,r2=6*ht, r1=14*ht);
        // Horse
        polyhedron(
            points = [[7*ht,0,0],[-7*ht,0,0],
                      [-7*ht,-20*ht,40*ht],[7*ht,-20*ht,40*ht],
                      [7*ht,20*ht,60*ht],[-7*ht,20*ht,60*ht]],
    
            faces = [[0,1,2,3],[5,2,1],[5,4,3,2],[0,3,4],[0,4,5,1]]
        );
    }
}

module bishop(height){
    $fn=6;
    ht=height/60;
    cylinder(h=60*ht,r2=2*ht, r1=14*ht);
}

module king(height){
   $fn=3;
   union(){
       ht=height/60;
       // Base 
       cylinder(h=60*ht,r=14*ht);
       rotate([0,0,60]) cylinder(h=60*ht,r=14*ht);
   }
}

module queen(height){
    ht=height/60;
    $fn=6;
    cylinder(h=60*ht,r=14*ht);
}