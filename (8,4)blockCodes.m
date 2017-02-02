%This code needs validation-2.2.2017

H = input('Enter the Parity Check Matrix (PS: Follow matlab syntax): ');
display(H,'Parity Check Matrix');
[m,n] = size(H);
k = n-m;
P = H(:,[1 2 3 4]);
display(P,'Parity Matrix');
Pt = transpose(P);
Ik = eye(k);
G = [Ik Pt];
display(G,'Generator Matrix');
d = [0 0 0 0;0 0 0 1;0 0 1 0;0 0 1 1;0 1 0 0;0 1 0 1;0 1 1 0;0 1 1 1;1 0 0 0;1 0 0 1;1 0 1 0;1 0 1 1;1 1 0 0;1 1 0 1;1 1 1 0;1 1 1 1];
for i = 2:1:16
codeWords(i,:)= mod(d(i,:)*G,2);
c((i-1),:)= mod(d(i,:)*G,2);
end
display(codeWords,'Code Words');
w = sum(c,2);
dmin = min(w);
display(dmin,'Minimum Hamming Distance');
Ht = transpose(H);
error = eye(n);
syndrome = mod(error*Ht,2);
display(error,'Error Vector');
display(syndrome,'Syndrome Vector');
codeIn = input('Enter a code word: ');
errorIn = input('Enter the 1-bit error: ');
r = mod(codeIn+errorIn,2);
synError = mod(errorIn*Ht,2);
display(synError,'Syndrome for message received with error: ');             %Display calculated syndrome
display(Ht,'Parity check matrix transpose')                                 %Display Ht
position = 0;
if synError == [0 0 0 0];
    display('No error in received message.');
else
    for i = 1:n
        if(i==n&&position==0)
            display('Error encountered is of more than 1-bit')
        end
        if synError == Ht(i,:);
            position = i;
            display(position,'There is error at the following position:')
            er = error(position,:);
            display('The corrected received code word is: ')
            correctCodeWord = mod(r+er,2)
            figure
            subplot(2,1,1)
            stem(correctCodeWord,'filled',':diamondr')
            title('Correct Code Word')
            subplot(2,1,2)
            stem(r,'filled')
            title('Received Error Message')
        end
    end
end
