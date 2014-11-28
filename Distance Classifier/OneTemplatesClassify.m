function Out = OneTemplatesClassify( X,Templates,Labels )

    Dist = pdist2(X,Templates);
    [y,id] = min(Dist,[],2);
    
    Out = Labels(id,:);


end

