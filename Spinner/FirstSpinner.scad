mult1 = 25;
mult2 = 43;

diam = 22.6;

difference()
{
    cylinder(h=7, d=76, center=true, $fn=150);
    
    cylinder(h=7.1, d=diam, center=true, $fn=60);
    
    for (i = [1:1:6])
    {
        translate([cos(i*60)*mult1, sin(i*60)*mult1, 0])
        cylinder(h=7.1, d=diam, center=true, $fn=60);
    }
    
    for (i = [1:1:6])
    {
        translate([cos(i*60+30)*mult2, sin(i*60+30)*mult2, 0])
        cylinder(h=7.1, d=diam, center=true, $fn=60);
    }
}