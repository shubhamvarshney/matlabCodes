%Ask for time sequence length%
askForLength = 'Input length of discrete time sequence ';
N = input(askForLength);

%Generate the arbitrary discrete sequence of specified length%
dts = 10*rand(1,N);                        %dts = Discrete Time Sequence

%Finding DTFT using DFT which in turn is obtained using FFT%
points = 256;                           %number of DFT points
DTS = fft(dts,points);                  %calculation of 256 pt DFT
DFT = fftshift(DTS);                    %shift DFT from 0 to 2pi, to -pi to +pi
w = 2*pi * (0:(points-1)) / points;     %obtaining frequencies corresponding to DFT samples
w1 = fftshift(w);                       %shift frequencies 0 to 2pi, to -pi to pi
w2 = unwrap(w1 - 2*pi);                 %remove 2pi discontinuity from w1

%Plot Discrete Time Signal and the DTFT calculated%
figure('Name','Discrete Time Signal')
stem(dts)
figure('Name','Frequency Domain Plot of x[n]')
plot(w2,abs(DFT));

%Upsampling and downsampling by factor of 4%
lengthUP = N + (N-1)*3;                 %length of upsampled sequence
lengthDOWN = (floor(N/4));              %length of downsampled sequence
dts_up = zeros(1,lengthUP);             %empty upsampled sequence
dts_down = zeros(1,lengthDOWN);         %empty downsampled sequence
for i=0:1:lengthUP                      %loop for upsampling
    if(mod(i,4)==0)
        dts_up(i+1) = dts(ceil((i+1)/4));
    else
        dts_up(i+1) = 0;
    end
end
for i=0:1:(lengthDOWN-1)                %loop for downsampling
    dts_down(i+1) = dts((4*i)+1);
end

%Calculating DTFT of upsampled and downsampled sequences%
DTFT_up = fftshift(fft(dts_up,points));
DTFT_down = fftshift(fft(dts_down,points));

%Plot upsampled and downsampled sequences
figure('Name','Frequency Domain Plot of x[n/4]')
plot(w2,abs(DTFT_up));
figure('Name','Frequency Domain Plot of x[4n]')
plot(w2,abs(DTFT_down));
figure('Name','Upsampled sequence')
stem(dts_up)
figure('Name','Downsampled sequence')
stem(dts_down)

squareAdd = 0;
for i=1:1:N
    squareAdd = squareAdd + (dts(i)*dts(i));     %calculate signalPower       
end
sigPower = 10*(log(squareAdd/N)/log(10));

askNoisePower = 'Input noise power in dB ';
sigmasq = input(askNoisePower);

snr = sigPower/sigmasq;

y = awgn(dts,snr);                              %pass signal through AWGN channel
YDTFT = fftshift(fft(y,points));                %DTFT of y

%Plot noisy sequence and its DTFT
figure('Name','Frequency Domain Plot of Noisy Sequence')
plot(w2,abs(YDTFT));
figure('Name','Noisy sequence')
stem(y)

%Passing the noisy sequence through moving average filter
y = [y,zeros(1,11)];
yf = zeros(1,N);
tempAdd = 0;
for i=0:1:(N-1)
    for j=0:1:10
        tempAdd = tempAdd+y((i+1)+j);
    end
    yf(i+1) = tempAdd/11;
end

%Plot filtered sequence yf
figure('Name','Sequence filtered from MA filter')
stem(yf)
