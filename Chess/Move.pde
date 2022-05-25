import java.util.*;
class Move{
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
   return getStart() == other.getStart() && getTarget() == other.getTarget();
 }
}
