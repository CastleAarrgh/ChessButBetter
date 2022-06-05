import java.util.*;
class Move implements Cloneable{
 public int[] start;
 public int[] target;
 Move(int[] start, int[] target){
   this.start = start;
   this.target = target;
 }
 public int[] getStart(){
   return start;
 }
 public int[] getTarget(){
   return target;
 }
 public boolean equals(Move other){
   return Arrays.equals(getStart(), other.getStart()) && Arrays.equals(getTarget(), other.getTarget());
 }
 public String toString(){
   return "(start: (" + start[0] + ", " + start[1] + "), target: (" + target[0] + ", " + target[1] + "))";
 }  
  public Move clone(){
    int[] newStart = start.clone();
    int[] newEnd = target.clone();
    return new Move(newStart, newEnd);
  }
}
