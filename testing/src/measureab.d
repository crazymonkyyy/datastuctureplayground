import std.stdio;
import core.time;
import std.process;

alias mt = MonoTime;
alias td = TickDuration;
alias now= TickDuration.currSystemTick;

td measure(string a)(){
  td start;
  td end;
  start=now;
  executeShell(a);
  end=now;
  return end - start;
}

void main(){
  //((long.max/MonoTime.ticksPerSecond)/(60*60*24)).writeln;
  td[] a;
  td[] b;
  a~=measure!"./a >> aout";
  b~=measure!"./b >> bout";
  auto targetlength=td(mt.zero.ticksPerSecond*5);
  //targetlength.writeln;
  //(a[0]+b[0]).writeln;
  auto repeat= (targetlength/(a[0]+b[0]).length).length;
  //repeat.writeln;
  a.reserve(repeat);
  b.reserve(repeat);
  foreach(i;1..repeat){a~=measure!"./a >> aout";}
  foreach(i;1..repeat){b~=measure!"./b >> bout";}
  td atotal;
  td btotal;
  foreach(i;0..repeat){atotal+=a[i];}
  foreach(i;0..repeat){btotal+=b[i];}
  atotal.writeln;
  btotal.writeln;
  repeat.writeln;
  (cast(double)atotal.length/btotal.length).writeln;
}