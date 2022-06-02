class Button{
   String text;
   int x;
   int y;
   int buttonWidth = 960;
   int buttonHeight = 175;
   int menu;
   int mode;
   int computerOn;
   int fontSize = 90;
   int col = color(111);
   Button(String text, int x, int y, int menu, int mode, int computerOn){
     this.text = text;
     this.x = x;
     this.y = y;
     this.menu = menu;
     this.mode = mode;
     this.computerOn = computerOn;
   }
    Button(String text, int x, int y, int buttonWidth, int buttonHeight, int fontSize, color c,  int menu, int mode, int computerOn){
     this.text = text;
     this.x = x;
     this.y = y;
     this.menu = menu;
     this.mode = mode;
     this.buttonWidth = buttonWidth;
     this.buttonHeight = buttonHeight;
     this.fontSize = fontSize;
     this.col = c;
     this.computerOn = computerOn;
   }
   public void displayButton(){
     textAlign(LEFT);
     fill(col);
     textSize(fontSize);
     rect(x, y, buttonWidth, buttonHeight);
     fill(0);
     text(text, x + 10, y + buttonHeight * .75);
   }
   public boolean inBounds(int mousex, int mousey){
     return mousex > x && mousey > y && mousex < x + buttonWidth && mousey < y + buttonHeight;
   }
   public int[] click(){
     return new int[]{menu, mode, computerOn};
   }
}
