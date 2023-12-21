module events();
	event e;
	initial
	    begin
		    $display("before the event started");
			->e;
			$display("event has started");
		end
	initial
	    begin 
		    @(e);
			$display("event is triggered using @");
		end
	initial
	    begin
		    wait@(e);
			$display("event is triggered using wait");
		end
endmodule

	