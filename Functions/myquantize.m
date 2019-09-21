function f = myquantize(I, quant_num)
    % Getting size of Image I and creating empty matrix B
    [m,n] = size(I);
    B = zeros(m,n);
    
    %Looping through Each element of I rows and columns
    for i=1:m
        for j=1:n
            %Getting the inital level
            level=round(255/quant_num);
            %looping through quant levels
            for k=1:quant_num
                if(I(i,j)>level)
                    %setting value of B(i,j)= current level + intial level
                    B(i,j)=level+round(255/quant_num);
                end
                %increasing level
                level=level+round(255/quant_num);
            end
        end
    end
    %Converting B to uint8 B
    B=uint8(B);
    %showing image
    figure, imshow(B);
    %returning the quantized matrix array
    B=round(B/(255/quant_num));
    for i=1:m
        for j=1:n
            if(B(i,j)==0)
                continue;
            end
            B(i,j)=B(i,j)-1;
        end
    end
    f=B;
end