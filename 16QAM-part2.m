prompt = 'Enter number of random bits to generate (please enter in powers of 2): ';
number = input(prompt);
rng default;
bits = randi([0 1],number,1);

symbolBinary = zeros((number/4),4);
signalSpace = zeros((number/4),1);
pointer = 1;

bitrate = 1;
T = length(bits)/bitrate;
n = 200;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));

for i = 0:length(bits)-1
  if bits(i+1) == 1
    x(i*n+1:(i+0.5)*n) = 1;
    x((i+0.5)*n+1:(i+1)*n) = 0;
  else
    x(i*n+1:(i+0.5)*n) = -1;
    x((i+0.5)*n+1:(i+1)*n) = 0;
  end
end

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

figure;
plot(t,x,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Polar RZ: [' num2str(transpose(bits)) ']']);

scatterplot(signalSpace);
