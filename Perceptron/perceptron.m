clear; clc;
w1=[0.1 6.8 -3.5 2.0 4.1 3.1 -0.8 0.9 5.0 3.9; 1.1 7.1 -4.1 2.7 2.8 5.0 -1.3 1.2 6.4 4.0]; 
w2=[7.1 -1.4 4.5 6.3 4.2 1.4 2.4 2.5 8.4 4.1;4.2 -4.3 0.0 1.6 1.9 -3.2 -4.0 -6.1 3.7 -2.2]; 

ww1 = [ones(1,size(w1,2));w1];
ww2 = [ones(1,size(w2,2));w2];

X = [ww1 -ww2];
k = 1;
eta = 0.5
W = rand(size(X,1),1);
ok = 0;
while(ok == 0)
    for i = 1:size(X,2)
        if (W' * X(:,i) < 0)
            k = k + 1;
            W = W + eta * X(:,i);
            break;
        else
            if (i == size(X,2))
                ok = 1;
            end
        end
    end
end
k
figure(1)
plot(w1(1,:),w1(2,:),'.')
hold on
plot(w2(1,:),w2(2,:),'*')
xmin=min(min(w1(1,:)),min(w2(1,:))); 
xmax=max(max(w1(1,:)),max(w2(1,:))); 
ymin=min(min(w1(2,:)),min(w2(2,:))); 
ymax=max(max(w1(2,:)),max(w2(2,:))); 
xindex=xmin-1:(xmax-xmin)/100:xmax+1; 
yindex=-W(2)*xindex/W(3)-W(1)/W(3); 
plot(xindex,yindex)%·ÖÀàÃæ


