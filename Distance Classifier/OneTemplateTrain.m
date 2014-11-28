function [ Templates, Labels ] = OneTemplateTrain( X,T )

    n = size(X,1);  %������
    Labels = eye(size(T,2));
    c = length(Labels(1,:)'); %�����
    dim = size(X,2); %����ά��
    
    Templates = zeros(c,dim);
    for i = 1:c
        id = find(T(:,i));   
        Templates(i,:) = mean(X(id,:));
    end

end

