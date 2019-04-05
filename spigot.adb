with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Calendar; use Ada.Calendar;

procedure spigot is
	n: integer := 1000;
	len: integer := (10*n)/3;
	a : array (1 .. len ) of integer;
	q : integer := 0;
	nines: integer := 0;
	predigit: integer := 0;	
	x : integer := 0;
	fileName : String(1 .. 100);
	Last : Integer;
	file : File_Type;

begin -- spigot
	Put_Line("please give a filename");
	Get_Line(fileName, Last);
	Create (File => file, Mode => Out_File, Name => filename);
	Set_Output(file);

	for z in 1 .. len loop
		a(z) := 2;
	end loop;
	for j in 1 .. n loop
		q := 0;
		for i in reverse 1 .. len loop
			x := 10*a(i) + q*i;
			a(i) := x mod (2*i-1);
			q := x / (2*i-1);
		end loop;
		a(1) := q mod 10;
		q := q / 10;
		if q = 9 then
			nines := nines +1;
		elsif q = 10 then
			put(predigit + 1, Width => 1);
			for k in 1 .. nines loop
				put(0, Width => 1);
			end loop;
			predigit := 0;
			nines := 0;

		else
			put(predigit, Width => 1);
			predigit := q;
			if nines /= 0 then
				for k in 1 .. nines loop
					put(9, Width => 1);
				end loop;
				nines := 0;
			end if;
		end if;
	end loop;
	put(predigit, Width => 1);
	--put("answer: ", Width => 1);
	--put(integerOut, Width => 1);
	--Put_Line("    Time it took(seconds): " & Duration'Image(finTime - startTime));
		
end spigot;

