class Button{
   String text;
   int x;
   int y;
   int buttonWidth = 960;
   int buttonHeight = 175;
   int menu;
   int mode;
   int computerOn;
   Button(String text, int x, int y, int menu, int mode, int computerOn){
     this.text = text;
     this.x = x;
     this.y = y;
     this.menu = menu;
     this.mode = mode;
     this.computerOn = computerOn;
   }
   public void displayButton(){
     fill(111);
     textSize(90);
     rect(x, y, buttonWidth, buttonHeight);
     fill(0);
     text(text, x + 30, y + 150);
   }
   public boolean inBounds(int mousex, int mousey){
     return mousex > x && mousey > y && mousex < x + buttonWidth && mousey < y + buttonHeight;
   }
   public int[] click(){
     return new int[]{menu, mode, computerOn};
   }
}
