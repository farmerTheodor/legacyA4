with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Calendar; use Ada.Calendar;

with stackADT; use stackADT;

procedure ackermann is
	integerOut : integer := 0;
	startTime : Time;
	finTime : Time;

	procedure execute_state(m : in integer; n : in out integer) is
		
	begin -- execute_state
		if m = 0 and n >= 0 then
			n := n + 1;
		elsif m > 0 and n = 0 then
			push(m-1, 1);
		elsif m > 0 and n > 0 then
			push(m-1, -1);
			push(m, n - 1);	
		end if;
	end execute_state;

	
	procedure calcAckermann(inputM : in integer; inputN: in integer; total : out integer) is
		n : integer := inputN;
		oldN : integer := inputN;
		m : integer := inputM;

	begin -- calcAckermann
		-- thing to talk about stack_is_empty does not require parenthesis
		reset_stack;
		--init state and push state onto stack
		--different states
		-- 1.) add 1 to n(m=0)
		-- 2.) push new frame onto stack with n set to 1 and m =  current m-1 from new(m > 0 and n = 0)
		-- 3.) push new frame onto stack with n set to a new stack frame with(m = current m and n - 1) and m =  current m-1 from new(m > 0 and n > 0)
		push(m, n);
		loop
			pop(m, n);
			if n = -1 then
				n := oldN;
			end if;
			execute_state(m, n);
			oldN := n;		
			exit when stack_is_empty;
		end loop;
		total := n;
	end calcAckermann;
	


begin -- ackermann
	startTime := Clock;
	calcAckermann(3, 4, integerOut);
	finTime := Clock;
	put("answer: ");
	put(integerOut);
	Put_Line("    Time it took(seconds): " & Duration'Image(finTime - startTime));
	reset_stack;
		
end ackermann;
