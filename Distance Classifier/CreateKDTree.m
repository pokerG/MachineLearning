function KDTree = CreateKDTree( S,Labels )

n = size(S,1);
global KDTree;
KDTree(n)=struct('Parrent',[],'Left',[],'Right',[],'s',[],'Sample',[],'Label',[]);
%根节点建树
KDTree(1).Parrent = 0;
Create(S,Labels,1);
end

%递归建树函数
function Create(D,Labels,t)
global KDTree;
n = size(D,1);  %建树样本数
switch n
    case 0  %建树完成
        return ;
    case 1  %建立叶节点
        KDTree(t).Sample = D(1,:);
        KDTree(t).Label = Labels(1,:);
        KDTree(t).s = 1;
        KDTree(t).Left = -1;
        KDTree(t).Right = -1;
    otherwise %建立中间节点
        sigma = var(D);
        [y,s] = max(sigma);
        
        %选择方差最大特征维的中值划分样本集
        [sortedD,id] = sortrows(D,s);
        median = ceil(n/2);
        clear sortedD;
        KDTree(t).Sample = D(id(median),:);
        KDTree(t).Label = Labels(id(median),:);
        KDTree(t).s = s;
        if median == 1
            KDTree(t).Left = -1;
        else
            KDTree(t).Left = t + 1;
        end
        KDTree(t).Right = t + median;
        
        KDTree(t+1).Parrent = t;
        KDTree(t+median).Parrent = t;
        
        %递归建立左子树
        DL = D(id(1:median-1),:);
        LabelsL = Labels(id(1:median-1),:);
        Create(DL,LabelsL,t+1);
        
        t = t + median;
        %递归建立右子树
        DR = D(id(median+1:n),:);
        LabelsR = Labels(id(median+1:n),:);
        Create(DR,LabelsR,t);
end
end
