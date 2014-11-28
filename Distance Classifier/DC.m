load('semeion.data');
img = semeion(:,1:256);
label = semeion(:,257:266);
trainN = 1000;

TP = zeros(10,1); FP = zeros(10,1);
FN = zeros(10,1); TN = zeros(10,1);

%K-D Tree

KDTree = CreateKDTree(img(1:trainN,:),label); 
n = size(img,1);
m = 0;
for i = trainN+1:n
    L = KDNNClassify(img(i,:),KDTree);
    if L == label(i,:)
      TP(find(L,1)) = TP(find(L,1)) + 1;
      for j = 1: size(label,2)
         if j ~= find(label(i,:),1)
             TN(j) = TN(j) + 1;
         end
      end
    else
      FN(find(label(i,:),1)) = FN(find(label(i,:),1)) + 1;
      FP(find(label(i,:),1)) = FP(find(label(i,:),1)) + 1;
    end
end

%OneTemplate Classify

% [Templates,Labels] = OneTemplateTrain(img(1:trainN,:),label(1:trainN,:));
% n = size(img,1);
% m = 0;
% for i = trainN + 1:n
%     L = OneTemplatesClassify(img(i,:),Templates,Labels);
%     if L == label(i,:)
%       TP(find(L,1)) = TP(find(L,1)) + 1;
%       for j = 1: size(label,2)
%          if j ~= find(label(i,:),1)
%              TN(j) = TN(j) + 1;
%          end
%       end
%     else
%       FN(find(label(i,:),1)) = FN(find(label(i,:),1)) + 1;
%       FP(find(label(i,:),1)) = FP(find(label(i,:),1)) + 1;
%     end
% end

recall = TP ./ (TP + FN);
precise = TP ./ (TP + FP);

ACC = (TP + TN) / (TP + TN + FP + FN);