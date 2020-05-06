program lab6;

{$APPTYPE CONSOLE}
{$R *.res}

const
  N = 5;
type
  TMas = array [0 .. N - 1, 0 .. N - 1] of integer;

  var
  A: TMas=((2,4,7,9,5), (6,12,32,93,82), (1,0,13,34,77),(88,106,8,3,16),(17,26,84,63,27)) ;
  i, j, CPrev, RPrev, CCurr, RCurr, x, y, changes, length, temp: integer;



procedure Writeln_m(const m: TMas; x_mas,y_mas: integer);
var
  i, j: integer;
begin
  for i := 0 to x_mas - 1 do   // loop1  (Сложный, внешний, с предусловием, с параметром)
  begin
    for j := 0 to y_mas - 1 do  // loop2  (Сложный, внутренний, с предусловием, с параметром)
      Write(m[i, j]:4);
    writeln;
  end;
end;


{procedure Zapolnenie (var m: Tmas; const size: integer);
var
  i, j: integer;
begin
randomize;
  for i := 1 to size do       // loop3  (Сложный, внешний, с предусловием, с параметром)
     for j := 1 to size do M[i][j]:= random(200);  // loop4   (Сложный, внутренний, с предусловием, с параметром)
end; }

begin
 // Zapolnenie (A,N);
  {for i := 0 to N-1 do  // loop  (Сложный, внешний, с предусловием, с параметром)
  begin
    for j := 0 to N-1 do  // loop  (Сложный, внутренний, с предусловием, с параметром)
         Read(A[i, j]);
  end;        }
  Writeln_m(A, N, N);
  writeln;
  for i := 1 to sqr(N) - 1 do     // loop5     (Сложный, внешний, с предусловием, с параметром)
      begin
         RCurr := 0;
         CCurr := 0;
          y := 1;
          x := 0;
          changes := 0;
          length := N;
          for j := 1 to sqr(N) - i do   // loop6    (Сложный, внутренний, с предусловием, с параметром)
            begin
              CPrev := CCurr;      // получение координат
              RPrev := RCurr;
              Dec(length);
              if length = 0 then
                 begin
                   length := N - ((changes div 2) - 1) - 2;
                   temp := y;  // направление(по часовой стрелке)
                   y := -x;
                   x := temp;
                   inc(changes);
                 end;
              Inc(CCurr, x);
              Inc(RCurr, y);
              if A[RCurr, CCurr] > A[RPrev, CPrev] then  // сравнение значиний, обмен
                begin
                  temp := A[RCurr, CCurr];
                  A[RCurr, CCurr] := A[RPrev, CPrev];
                  A[RPrev, CPrev] := temp;
                 end;
            end;
      end;
  Writeln_m(A, N, N);

  readln;
  readln;
end.
