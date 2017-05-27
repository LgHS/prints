use <ttf/LeagueGothic/LeagueGothic-Regular.otf>

 module CircularText(texte, font, radius, thick, sizeRatio=1, fullCirco=true)
 {
     for (i = [0:len(texte)])
     {
         translate([i*10,0,0])
         text(texte[i], font = "League Gothic");
     }
 }
 
 CircularText("Liege HackerSpace", "League Gothic");