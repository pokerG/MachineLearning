function output = KNNClassify( X,S,T,K )
    Labels = unique(T);
    c = length(Labels(1,:)); %类别数
    m = size(X,1);  %样本数
    
    Dist = pdist2(X,S);
    [y,id] = sort(Dist,2,'ascend');
    k = zeros(c,m);
    for i = 1:c
        if m == 1
            k(i) = sum(T(id(:,1:K)) == Labels(i));
        else
            k(i,:) = sum(T(id(:,1:K)) == Labels(i),2);
        end
    end
    [y,j] = max(k);
    output = Labels(j,:);
    


end

