include <ChessLib.scad>

$fn = 6;

// "p" or "P" for Pawn
// "r" or "R" for Rook
// "h" or "H" for Knight (Horse :-)
// "b" or "B" for bishop
// "q" or "Q" for Queen
// "k" or "K" for King

/// CONFIG ///

// One set 4*4
/*
pieces = [  ["p", "p", "p", "p"],
            ["P", "p", "p", "P"],
            ["r", "h", "b", "k"],
            ["r", "h", "b", "q"]];
            
numLig = 4;
numCol = 4;
*/

// One set 2*8
/*
pieces = [  ["p", "p", "p", "p", "p", "p", "p", "p"],
            ["r", "h", "b", "q", "k", "b", "h", "r"]];
            
numLig = 2;
numCol = 8;   
*/
// Complet chess game
/*
pieces = [  ["r", "h", "b", "q", "k", "b", "h", "r"],
            ["p", "p", "p", "p", "p", "p", "p", "p"],
            [" ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " ", " "],
            ["p", "p", "p", "p", "p", "p", "p", "p"],
            ["r", "h", "b", "q", "k", "b", "h", "r"]];
numLig = 8;
numCol = 8;            
*/

pieces = [  ["p", "p"],
            ["p", "p"]];

numLig = 2;
numCol = 2; 

stepByLig = 40;
stepByCol = 40;

height = 60;

printBoard = false;
heightCase = 4;

/// END OF CONFIG ///

for (y = [0:numLig-1])
{
    for (x = [0:numCol-1])
    {
        if (printBoard && (x+y) % 2 == 0)
            translate([x*stepByLig-stepByLig/2, y*stepByCol-stepByCol/2,0])
            cube([stepByLig, stepByCol, heightCase]);
            
        translate([x*stepByLig,y*stepByCol,(printBoard) ? heightCase : 0])
        {
            if (pieces[y][x] == "p" || pieces[y][x] == "P") 
                pawn(height);
            else if (pieces[y][x] == "r" || pieces[y][x] == "R")
                rook(height);
            else if (pieces[y][x] == "h" || pieces[y][x] == "H")
                knight(height);
            else if (pieces[y][x] == "b" || pieces[y][x] == "B")
                bishop(height);
            else if (pieces[y][x] == "q" || pieces[y][x] == "Q")
                queen(height);
            else if (pieces[y][x] == "k" || pieces[y][x] == "K")
                king(height);
            else if (pieces[y][x] == " ");
            else
                color("red") cube(stepByLig, center=true);
        }
    }
}