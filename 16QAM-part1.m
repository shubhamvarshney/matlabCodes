QAMlevels = 16;
symbolValues = (0:(QAMlevels-1));
symbolBinary = zeros(16,4);
signalSpace = zeros(16,1);

for i=1:16
    symbolBinary(i,:) = de2bi(symbolValues(i),4);
end

for i=1:16
    if(symbolBinary(i,4)==0&&symbolBinary(i,3)==0)
        if(symbolBinary(i,2)==0&&symbolBinary(i,1)==0)
            signalSpace(i,:) = 1+1i;
        elseif(symbolBinary(i,2)==0&&symbolBinary(i,1)==1)
            signalSpace(i,:) = 3+1i;
        elseif(symbolBinary(i,2)==1&&symbolBinary(i,1)==0)
            signalSpace(i,:) = 1+3i;
        else
            signalSpace(i,:) = 3+3i;
        end
    end
    
    if(symbolBinary(i,4)==0&&symbolBinary(i,3)==1)
        if(symbolBinary(i,2)==0&&symbolBinary(i,1)==0)
            signalSpace(i,:) = -1-1i;
        elseif(symbolBinary(i,2)==0&&symbolBinary(i,1)==1)
            signalSpace(i,:) = -3-1i;
        elseif(symbolBinary(i,2)==1&&symbolBinary(i,1)==0)
            signalSpace(i,:) = -1-3i;
        else
            signalSpace(i,:) = -3-3i;
        end
    end
    
    if(symbolBinary(i,4)==1&&symbolBinary(i,3)==0)
        if(symbolBinary(i,2)==0&&symbolBinary(i,1)==0)
            signalSpace(i,:) = -1+1i;
        elseif(symbolBinary(i,2)==0&&symbolBinary(i,1)==1)
            signalSpace(i,:) = -3+1i;
        elseif(symbolBinary(i,2)==1&&symbolBinary(i,1)==0)
            signalSpace(i,:) = -1+3i;
        else
            signalSpace(i,:) = -3+3i;
        end
    end
    
    if(symbolBinary(i,4)==1&&symbolBinary(i,3)==1)
        if(symbolBinary(i,2)==0&&symbolBinary(i,1)==0)
            signalSpace(i,:) = 1-1i;
        elseif(symbolBinary(i,2)==0&&symbolBinary(i,1)==1)
            signalSpace(i,:) = 3-1i;
        elseif(symbolBinary(i,2)==1&&symbolBinary(i,1)==0)
            signalSpace(i,:) = 1-3i;
        else
            signalSpace(i,:) = 3-3i;
        end
    end
end

scatterplot(signalSpace);
