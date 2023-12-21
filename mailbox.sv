class a;
    string raghu;
	mailbox#(string) m;
	function new(mailbox m1);
	    this.m=m1;
	endfunction
	task send();
	    raghu="good man";
		m.put(raghu);
	    $display("transmitted data %0s",raghu);
	endtask
endclass
class b;
	mailbox#(string) m2;
	function new(mailbox m2);
	    this.m=m2;
	endfunction
	task receive();
		m.get(raghu);
		$display("received value is %0s",raghu);
	endtask
endclass
module top();
    a a1;
	b b1;
	mailbox mb=new();
	initial
	    begin
	    a1=new(mb);
		b1=new(mb);
		a1.send;
		b1.receive();
		end
endmodule