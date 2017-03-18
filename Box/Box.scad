function sumv(v,i,s=0) = (i<0 ? 0 :(i==s ? v[i] : v[i] + sumv(v,i-1,s)));

lgs = [54,54,54];
ep_pt_cotes = 2;
ep_gd_cotes = 2;
ep_fond = 3;
ep_inter = 2;
largeur = 12;
hauteur = 120;

difference()
{
    color("red")
    cube([sumv(lgs,len(lgs)-1)+(len(lgs)-1)*ep_inter+2*ep_pt_cotes,largeur+2*ep_gd_cotes,ep_fond+hauteur]);
    
    for(i = [0 : len(lgs)-1])
        translate([ep_pt_cotes+sumv(lgs,i-1)+i*ep_inter,ep_gd_cotes,ep_fond])
        cube([lgs[i],largeur,hauteur+1]);
}