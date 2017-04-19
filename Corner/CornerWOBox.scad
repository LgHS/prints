$fn = 20;

/* [Parameters] */
// Length of the tips
length = 40;
// Width of the tips
width = 26;
// Width of the profile
widthProf = 20.5;
// Exceeding of the void profile
fudge = 0.1;
// Diameter of the holes
diameter = 2;

thick = (width-widthProf) / 2;

module tip(center=true)
{
    translate([
        (center) ? 0 : length/2,
        (center) ? 0 : width/2,
        (center) ? 0 : width/2
    ])
    {
        difference()
        {
            color("blue")
            cube([length, width, width], center=true);
            
            color("red")
            //translate([0, thick, thick])
            cube([length+fudge, widthProf, widthProf], center=true);
        
            color("yellow")
            translate([0, 0, widthProf/2+thick/2])
            cylinder(h=thick+2*fudge, r=diameter/2, center=true);
            
            color("yellow")
            translate([0, widthProf/2+thick/2, 0])
            rotate([90, 0,0])
            cylinder(h=thick+2*fudge, r=diameter/2, center=true);
        }
    }
}

union()
{
    color("green")
    cube(width);
    
    translate([width,0,0])
    tip(false);
    
    translate([0, width, 0])
    rotate([90,0,90])
    tip(false);
    
    translate([0, 0, length+width+0.1])
    rotate([0,90,0])
    tip(false);
}