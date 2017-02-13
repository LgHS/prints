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
    translate([0,0,30*ht]){
        rotate([0,0,45]){
    cube([24*ht,24*ht,60*ht], center=true);
    }    
}
    
    translate([0,0,30*ht]){
    cube([20*ht,20*ht,60*ht], center=true);
    }
}
        // Crenels
        union(){
            translate([0,0,58.2*ht]){
                cube([30*ht,4*ht,4*ht],center=true);
            }
            translate([0,0,58.2*ht]){
                cube([4*ht,30*ht,4*ht],center=true);
            }
        }
    }
}
    


module pawn(height) {
    ht = height/60;
    union(){
        cylinder(h=30*ht,r2=6*ht, r1=14*ht);
        translate([0,0,28*ht]){
        scale([1.4,1.4,2.2]){
        rotate([45,45,45]){
            
        cube(10,10,10, center=true);
        }
    }
    }
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


if (printHalfPieces==true){
// Rooks
for (i = [0:7:7]){
        translate([i*40,j*40,0]){
            rook(60);
        }
}

// Pawns
for (j = [0:1:7]){
    translate([j*40,40,0]){
    pawn(60);
    }
}

// Knights

for (i= [1:5:6]){
    translate([i*40,0,0]){
        knight(60); 
    }
}

for (i= [2:3:5]){
    translate([i*40,0,0]){
        rotate([0,0,0]){
            bishop(60); 
        }
    }
}

// Queens
translate([120,0,0]){
    queen(60);
}

// Kings
translate([160,0,0]){
    king(60);
}

}

if (printAllPieces==true) {
// Rooks
for (i = [0:7:7]){
    for (j = [0:7:7]){
        translate([i*40,j*40,0]){
            rook(60);
        }
    }
}

// Pawns
for (i = [1:5:6]){
    for (j = [0:1:7]){
        translate([j*40,i*40,0]){
        pawn(60);
        }
    }
}

// Knights
for (i= [1:5:6]){
        translate([i*40,280,0]){
            rotate([0,0,180]){
        knight(60); 
        }
    }
}

for (i= [1:5:6]){
        translate([i*40,0,0]){
            knight(60); 
        }
    }

// Bishops
for (i= [2:3:5]){
        translate([i*40,280,0]){
            rotate([0,0,180]){
                bishop(60); 
            }
        }
    }

for (i= [2:3:5]){
        translate([i*40,0,0]){
            rotate([0,0,0]){
                bishop(60); 
            }
        }
    }

// Queens
translate([120,0,0]){
    queen(60);
}

translate([120,280,0]){
    queen(60);
}

// Kings
translate([160,0,0]){
    king(60);
}

translate([160,280,0]){
    king(60);
}
}

if (printBoard==true){

// Board
for (i = [0:1:7]){
    for (j = [0:1:7]){
        if ((i+j) % 2 == 0) {
            translate([j*40,i*40,0]){
            square(40, center=true);
            }
        }
    }
}
}


if (printFive==true){
    pawn(60);
    translate([40,0,0]) rook(60);
    translate([0,40,0]) knight(60);
    translate([0,-40,0]) bishop(60);
    translate([-40,0,0]) queen(60);
    translate([40,40,0]) king(60);
}
    
