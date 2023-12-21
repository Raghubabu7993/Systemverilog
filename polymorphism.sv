class trans;
    virtual function void display();
        $display("parent classs");
    endfunction
endclass
class ram extends trans;
    function void display();
        $display("child class");
    endfunction
endclass
trans t1;
ram r;
module poly();
initial
    begin
        t1=new();
        r=new();
        t1=r;
		t1.display();
	end
endmodule
