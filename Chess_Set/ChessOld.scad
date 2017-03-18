$fn = 12;


module rook(height) {
    ht=height/60;
    // Base
    union(){
        cylinder(h=50*ht,r2=10*ht, r1=13*ht);
        
        cylinder(h=10*ht,r1=16*ht,r2=10*ht);
        
        translate([0,0,50*ht]){
            cylinder(h=3*ht,r1=10*ht,r2=12*ht);
        }
    
    // Top
    difference(){
        // Hollow top
        difference(){
            translate([0,0,53*ht]){
                cylinder(h=7*ht,r=12*ht);
            }
            translate([0,0,53*ht]){
                cylinder(h=7.1*ht,r=9*ht);
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
}

module pawn(height) {
    ht = height/60;
    union(){
        cylinder(h=30*ht,r2=5*ht, r1=12*ht);
        
        cylinder(h=8*ht,r1=15*ht,r2=10*ht);
        
        translate([0,0,30]){
            sphere(8*ht);
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
    ht=height/60;
    difference(){
        union(){
            cylinder(h=40*ht,r2=5*ht, r1=10*ht);
            cylinder(h=10*ht,r1=15*ht,r2=8*ht);
            
            translate([0,0,45]){
                resize([13*ht,13*ht,20*ht]){
                sphere(10*ht);
                }
            }
        }

        translate([-10*ht,1*ht,46*ht]){
            rotate([45,0,0]){
                cube([20*ht,20*ht,3*ht]);
            }
        }
    }
}

module queen(height){
   ht=height/60;
    difference(){
        // Base 
        union(){
            cylinder(h=40*ht,r2=6*ht, r1=10*ht);
            cylinder(h=10*ht,r1=15*ht,r2=8*ht);
            
            translate([0,0,40*ht]){
                cylinder(13*ht,r1=6*ht,r2=8.2*ht);
            }
        }
        
        // Crown (negative space)
        union(){
            for (i=[1:1:4]){
                translate([0,0,53*ht]){
                    rotate([0,45,45*i]){
                        cube([3*ht,20*ht,3*ht], center=true);
                    }
                }
            }
        }
    }
}
module king(height){
    ht=height/60;
    union(){
        difference(){
            union(){
                cylinder(h=40*ht,r2=6*ht, r1=10*ht);
                cylinder(h=10*ht,r1=15*ht,r2=8*ht);
    
                translate([0,0,40*ht]){
                    cylinder(13*ht,r1=6*ht,r2=8.2*ht);
                }
            }
            
            union(){
                for (i=[1:1:4]){
                    translate([0,0,53*ht]){
                        rotate([0,45,45*i]){
                            cube([3*ht,20*ht,3*ht], center=true);
                        }
                    }
                }
            }
        }

        union(){
            for (i=[1:2:4]){
                translate([0,0,53*ht]){
                    resize([10*ht,10*ht,20*ht]){
                        sphere(10*ht);
                    }
                    
                    rotate([0,45,45*i]){
                        cube([3*ht,16*ht,3*ht], center=true);
                    }
                }
            }
        }
    }
}


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
