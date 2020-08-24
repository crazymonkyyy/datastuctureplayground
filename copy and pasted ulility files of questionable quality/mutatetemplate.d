mixin template mutatingsystem(T,alias f){
  struct mutate(string myname){
    T payload;
    void opOpAssign(string op,S)(S a){
      mixin("payload = payload"~op~"a;");
    }
    void opAssign(S)(S a){
      payload=a;
      pragma(inline, false); 
      mixin(thedata[myname]);
    }
    int opCmp(S)(S a){
      return payload.opCmp(a);
    }
    bool opEquals(S)(S a){
      return payload==a;
    }
  }
  enum string[string] thedata={
    string[string] thedata_;
    f(thedata_);
    return thedata_;
  }();
  static foreach(string s;thedata.keys){
    mixin("mutate!(q{"~s~"}) "~s~";");
  }
}

unittest{
  void foobar(T)(ref T mutate){
    mutate["foo"]~=q{
      fizz=3;
    };
    mutate["foo"]~=q{
      import std.stdio; "foo".writeln;
      if(payload!=10){bar=3;}
    };
    mutate["bar"]~=q{
      import std.stdio; "bar".writeln;
      foo=10;
    };
    mutate["fizz"]~=q{
      import std.stdio; "fizz".writeln;
      if(bar!=3){
        bar=10;
      }
      //foo=4;
      if(foo==3){"i'm scary".writeln;}
    };
  }
  mixin mutatingsystem!(int,foobar);
  //foo=1;
  //assert(foo==10);
  //assert(bar==3);
}
unittest{
  void foobar(T)(ref T mutate){
    mutate["foo"]~=q{
      import std.stdio; "foo".writeln;
      if(payload>0){bar=payload-1;}
    };
    mutate["bar"]~=q{
      import std.stdio; "bar".writeln;
      foo=payload;
    };
  }
  mixin mutatingsystem!(int,foobar);
  foo=3;  
}
