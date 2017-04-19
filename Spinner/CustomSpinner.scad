/* [Dimensions of the Spinner] */
// Outer Diameter
sOuterDiameter = 76;
// Outer thickness
sOuterThickness = 10;

/* [Dimensions of the Main Bearing] */
// Outer Diameter
mBOuterDiameter = 22;
// Outer thickness (same as outer thickness of the spinner, exept if you active the edgeless property)
mBOuterThickness = 7;
// Active the edgeless property
mBActiveEdgeless = true; // [true:Yes, false:No]
// Height of the sphere (for edgeless)
mBHeightEdgelessSphere = 30;
// Radius of the sphere (for edgeless)
mBRadiusEdgelessSphere = 28;
// Precision of the sphere (for edgeless)
mBPrecisionEdgelessSphere = 25;

fudge = 0.1;

difference ()
{
    color("red")
    cylinder(h=sOuterThickness, d=sOuterDiameter, center=true);
    
    cylinder(h=sOuterThickness+2*fudge, d=mBOuterDiameter, center=true);
    
    if (mBActiveEdgeless)
    {
        translate([0,0,mBHeightEdgelessSphere])
        sphere(r=mBRadiusEdgelessSphere, $fn=mBPrecisionEdgelessSphere);
        
        translate([0,0,-mBHeightEdgelessSphere])
        sphere(r=mBRadiusEdgelessSphere, $fn=mBPrecisionEdgelessSphere);
    }
}