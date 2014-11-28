function L = KDNNClassify(x,KDTree)

p = 1; Head = 1;
Nearest = p; MinDist = inf;

%深度优先搜索K-D树，确定x所在子区域
while p ~= -1
    Stack(Head) = p;
    Head = Head + 1;
    Dist =sqrt((x - KDTree(p).Sample) * (x - KDTree(p).Sample)');
    if Dist < MinDist
        Nearest = p;
        MinDist = Dist;
    end
    s = KDTree(p).s;
    if x(s) < KDTree(p).Sample(s)
        p = KDTree(p).Left;
    else
        p = KDTree(p).Right;
    end
end

%回溯寻找最近邻样本
while Head ~= 1
    Head = Head - 1;
    p = Stack(Head);
    s = KDTree(p).s;
    
    if abs(x(s) - KDTree(p).Sample(s)) < MinDist
        if x(s) < KDTree(p).Sample(s)
            p = KDTree(p).Right;
        else
            p = KDTree(p).Left;
        end
        
        while p ~= -1
            Stack(Head) = p;
            Head = Head + 1;
            
            Dist = sqrt((x - KDTree(p).Sample) * (x - KDTree(p).Sample)');
            if Dist < MinDist
                Nearest = p;
                MinDist = Dist;
            end
            
            s = KDTree(p).s;
            if x(s) < KDTree(p).Sample(s)
                p = KDTree(p).Left;
            else
                p = KDTree(p).Right;
            end
        end
    end
    
    if p ~= -1
        Dist = sqrt((x - KDTree(p).Sample) * (x - KDTree(p).Sample)');
        if Dist < MinDist
            Nearest = p;
            MinDist = Dist;
        end
    end
end
L = KDTree(Nearest).Label;


end

