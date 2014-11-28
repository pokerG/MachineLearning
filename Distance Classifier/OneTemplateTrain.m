function [ Templates, Labels ] = OneTemplateTrain( X,T )

    n = size(X,1);  %样本数
    Labels = eye(size(T,2));
    c = length(Labels(1,:)'); %类别数
    dim = size(X,2); %特征维数
    
    Templates = zeros(c,dim);
    for i = 1:c
        id = find(T(:,i));   
        Templates(i,:) = mean(X(id,:));
    end

end

