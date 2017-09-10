
x=input('Enter the length of the sequence to be generated:');
m=randi([0,1],1,x);
i=1;
for j=1:1:x
    if(m(:,j)==0)
        n(:,i)=-1;
        for o=1:1:99
            n(:,i+o)=-1;
        end
    else
        n(:,i)=1;
        for o=1:1:99
            n(:,i+o)=1;
        end
    end
    i=i+100;
end
subplot(2,2,1),plot(n)
[b,a]=butter(5,0.02);
fsig=filter(b,a,n);
subplot(2,2,2),plot(fsig)
rs=awgn(fsig, 30);
subplot(2,2,3),plot(rs)
k=1;
for s=1:1:(x/2)
    for p=1:1:200
        r(:,p)=rs(:,k);
        k=k+1;
    end
    subplot(2,2,4),plot(r), hold on
end
