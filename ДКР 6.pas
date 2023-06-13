Program DKR6;
uses crt;

const
  max_size = 5;

type
  List = array[1..max_size] of record
    next: integer;
    data: integer;
  end;

var
  lit: List;
  head, tail: integer;

procedure deleteNode; // удаление 
begin
  if head = tail then
    writeln('Список пуст')
  else
  begin
    lit[head].data := 0;
    head := lit[head].next;
  end;
end;

procedure addNode(a: integer); // добавление 
var
  i: integer;
begin
  if (tail + 1) mod max_size = head then begin
    deleteNode;
    i := i - 1;
    addNode(a);
  end
  else
  begin
    i := tail + 1;
    if i = max_size then
    begin
      deleteNode;
      i := 1;
    end;
    lit[i].data := a;
    lit[tail].next := i;
    tail := i;
  end;
end;

procedure printList1; // список
var
  i: integer;
begin
  writeln('Кольцевой список:');
  i := head;
  while i <> tail do
  begin
    write(lit[i].data, ' ');
    i := lit[i].next;
  end;
  write(lit[i].data);
  writeln;
  readln;
end;

var
  choice: integer;
  value: integer;

begin
  head := 1;
  tail := 1;
  
  repeat
    writeln('1. Добавка элемента');
    writeln('2. Удаление элемента');
    writeln('3. Показать список');
    writeln('4. Выход');
    write('Выберете вариант: ');
    readln(choice);
    
    case choice of
      1:
        begin
          write('Ведите число: ');
          readln(value);
          addNode(value);
        end;
      2: deleteNode;
      3: printList1;
      4:;
    else writeln('Не правильно выбран вариант');
    end;
    clrscr();
  until choice = 4;
end.