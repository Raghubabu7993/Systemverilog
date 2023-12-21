class sub;
    int b;
	function sub copy();
	    copy=new();
		copy.b=this.b;
	endfunction
endclass
class main;
    sub s=new();
    int a;
	function main copy();
	    copy=new();
		copy.a=this.a;
		copy.s.=this.s.copy(); 
	endfunction
endclass
module shall();
    main m1,m2;
	initial
	    begin
		    m1=new();
			m1.a=50;
			m1.s.b=90;
			m2=m1.copy();
			m2.s.b=100;
			$display("value of a is %0d",m2.a);
			m2.a=10;
			$display("value of a is %0d and %0d",m1.a,m2.a);
			$display("address of handles are %0d and %0d",m1,m2);
		end
endmodule
	