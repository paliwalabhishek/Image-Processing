function f = myhisteq(I)
    %Calling myhist function to get normalized histogram
    norm_hist = myhist(I);
    %getting number of pixels
    numOfPixels = size(I,1)*size(I,2);
    %creating an empty vector which is used to store summing values
    eq_vec = zeros(1,256);
    %norm_sum it's a cummulative sum
    norm_sum=0;
    
    %Looping the normalized histogram, getting cummulative sum and
    %multiplying the (L-1) with cummulative sum then storing in vector
    for i=1:size(norm_hist,2)
        norm_sum = norm_sum+norm_hist(i);
        eq_vec(i) = (size(eq_vec,2)-1)*(norm_sum);
    end
    %Rounding the values of eq_vec
    eq_vec = round(eq_vec);
    %Creating a vector which contains number of pixels
    hist_vec = norm_hist * numOfPixels;
    %Creating a eqaulized histogram vector initialzing with zeros
    temp = zeros(1,256);
    sum=0;
    %looping so that equalized histogram values can be updated with sum of
    %pixels from hist_vec
    for i=1:size(eq_vec,2)
        sum=sum+hist_vec(i);
        if(i+1 <= size(eq_vec,2))
            %Checking if there is a change in eq_vec values
            if(eq_vec(i)~=eq_vec(i+1))
                t=eq_vec(i)+1;
                temp(t)= sum;
                sum=0;
            end
        end 
    end
    % Generating Equalized Normalized Histogram
    x=1:size(temp,2);
    y=temp(x)/numOfPixels;
    figure, bar(x,y,0.6);
    title('Equalized Normalized Histogram');
    xlabel('Intensity Levels');
    ylabel('Probablity of occurrence of Intensity Level');
    f = y;
end

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