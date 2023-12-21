//functional coverage
module covera();
    bit [2:0]a;
	bit [2:0]values[$]='{1,0,0,1};
	int b;
	covergroup cgroup;
        a:coverpoint a[]={2,5,7};
		//toggle coveage using iff condition		
		b:coverpoint b{bins b  iff(0=>1 or 1=>0)   //doubt
                             		{bins b1={4}
								      bins b2={5};}
        //transistion bins
		c:coverpoint a{bins trans=(1=>0);
		               bins trans1=(0>=1);
					   bins trans2=(1,2=>3,4)}//1->3,2->3,1->4,2->4
					   
		//repetition bins
		d:coverpoint a{bins r=(2[*3]);
		               bins k=(4[*3:10]);}
		            
		//wildcard bins
        e:coverpoint a{wildcard bins a1={3'b00x};}	
 
        //ignore bins
        f:coverpoint a{ignore_bins a1={6,7};}
        //illegal bins
        g:coverpoint a{illegal_bins a1={10,11};}
    
        //normal bins 
        k:coverpoint a{bins low={0:255};
		               bins mid={256:520};
					   bins high={530:1024};}	
	endgroup
    cgroup c;
	initial
	    begin
		    c=new();
			foreach(values[i])
			a=values[i];
			a.sample();
			$display("val =%d, cov = %0.2f %%",a,c.get_inst_coverage());  
		end
endmodule
