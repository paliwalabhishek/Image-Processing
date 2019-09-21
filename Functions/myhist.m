function f = myhist(I)
    %Getting row and column of Matrix I
    [m,n]=size(I);
    
    %Creating Vector[1X256] of Zeros as Intensity Levels
    hist_vector=zeros(1,256);
    
    %Counting pixels one-by-one as per intensity levels and Putting in 
    %Zeros Vector postion accordingly
    for i=1:m
        for j=1:n
            hist_vector(I(i,j))= hist_vector(I(i,j))+1;
        end
    end
    
    %Plotting hist_vector values vs intensity level
    x=1:256;
    norm_hist_vec=hist_vector(x) / (m*n);
    figure, bar(x,norm_hist_vec,0.6);
    title('Normalized Histogram');
    xlabel('Intensity Levels');
    ylabel('Probablity of occurrence of Intensity Level');
    
    %returning histogram vector values as vector
    f=norm_hist_vec;
end