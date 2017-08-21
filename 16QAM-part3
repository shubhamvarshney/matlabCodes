prompt = 'Enter number of random bits to generate (please enter in powers of 2): ';
number = input(prompt);
rng default;
bits = randi([0 1],number,1);

symbolBinary = zeros((number/4),4);
signalSpace = zeros((number/4),1);
receivedSignal = zeros((number/4),1);

pointer = 1;
EbNo = 10;
snr = EbNo + 10*log10(4);

for i=1:(number/4)
    for j=1:4
        symbolBinary(i,j) = bits(pointer,:);
        pointer = pointer +1;
    end
end

for i=1:(number/4)
    if(symbolBinary(i,1)==0&&symbolBinary(i,2)==0)
        if(symbolBinary(i,3)==0&&symbolBinary(i,4)==0)
            signalSpace(i,:) = 1+1i;
        elseif(symbolBinary(i,3)==0&&symbolBinary(i,4)==1)
            signalSpace(i,:) = 3+1i;
        elseif(symbolBinary(i,3)==1&&symbolBinary(i,4)==0)
            signalSpace(i,:) = 1+3i;
        else
            signalSpace(i,:) = 3+3i;
        end
    end
    
    if(symbolBinary(i,1)==0&&symbolBinary(i,2)==1)
        if(symbolBinary(i,3)==0&&symbolBinary(i,4)==0)
            signalSpace(i,:) = 1-1i;
        elseif(symbolBinary(i,3)==0&&symbolBinary(i,4)==1)
            signalSpace(i,:) = 1-3i;
        elseif(symbolBinary(i,3)==1&&symbolBinary(i,4)==0)
            signalSpace(i,:) = 3-1i;
        else
            signalSpace(i,:) = 3-3i;
        end
    end
    
    if(symbolBinary(i,1)==1&&symbolBinary(i,2)==0)
        if(symbolBinary(i,3)==0&&symbolBinary(i,4)==0)
            signalSpace(i,:) = -1+1i;
        elseif(symbolBinary(i,3)==0&&symbolBinary(i,4)==1)
            signalSpace(i,:) = -1+3i;
        elseif(symbolBinary(i,3)==1&&symbolBinary(i,4)==0)
            signalSpace(i,:) = -3+1i;
        else
            signalSpace(i,:) = -3+3i;
        end
    end
    
    if(symbolBinary(i,1)==1&&symbolBinary(i,2)==1)
        if(symbolBinary(i,3)==0&&symbolBinary(i,4)==0)
            signalSpace(i,:) = -1-1i;
        elseif(symbolBinary(i,3)==0&&symbolBinary(i,4)==1)
            signalSpace(i,:) = -3-1i;
        elseif(symbolBinary(i,3)==1&&symbolBinary(i,4)==0)
            signalSpace(i,:) = -1-3i;
        else
            signalSpace(i,:) = -3-3i;
        end
    end
end

for i=1:(number/4)
receivedSignal(i,:) = awgn(signalSpace(i,:),snr,'measured');
end

sPlotFig = scatterplot(receivedSignal,1,0,'g.');
hold on
scatterplot(signalSpace,1,0,'k*',sPlotFig)
