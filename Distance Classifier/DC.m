clear; clc;
load('semeion.data');
img = semeion(:,1:256);
label = semeion(:,257:266);
trainN = 1200;  %训练样本

TP = zeros(10,1); FP = zeros(10,1);
FN = zeros(10,1); TN = zeros(10,1);

%K-D Tree

KDTree = CreateKDTree(img(1:trainN,:),label); 
n = size(img,1);
m = 0;
for i = trainN+1:n  %测试样本
    L = KDNNClassify(img(i,:),KDTree);
    if L == label(i,:)
      TP(find(L,1)) = TP(find(L,1)) + 1;  %识别正确的标号TP +1
      for j = 1: size(label,2)
         if j ~= find(label(i,:),1)
             TN(j) = TN(j) + 1; %其余标号TN  +1
         end
      end
    else
      FN(find(label(i,:),1)) = FN(find(label(i,:),1)) + 1;  %真的标号FN +1
      FP(find(L,1)) = FP(find(L,1)) + 1;  %识别出来的标号FP +1
      for j = 1: size(label,2)
         if j ~= find(label(i,:),1) &&  j ~= find(L,1)
             TN(j) = TN(j) + 1; %其余标号TN  +1
         end
      end
    end
end

recall = TP ./ (TP + FN);
precise = TP ./ (TP + FP);
specificity = TN ./(FP + TN);
ACC = (TP + TN) ./ (TP + TN + FP + FN);

disp ('KDNNClassify:');
disp ('recall:');
disp (recall );
disp ('precise:');
disp (precise);
disp ('specificity:');
disp (specificity );
disp ('ACC:');
disp (ACC);

%OneTemplate Classify

TP = zeros(10,1); FP = zeros(10,1);
FN = zeros(10,1); TN = zeros(10,1);
[Templates,Labels] = OneTemplateTrain(img(1:trainN,:),label(1:trainN,:));
n = size(img,1);
m = 0;
for i = trainN + 1:n
    L = OneTemplatesClassify(img(i,:),Templates,Labels);
    if L == label(i,:)
      TP(find(L,1)) = TP(find(L,1)) + 1;  %识别正确的标号TP +1
      for j = 1: size(label,2)
         if j ~= find(label(i,:),1)
             TN(j) = TN(j) + 1; %其余标号TN  +1
         end
      end
    else
      FN(find(label(i,:),1)) = FN(find(label(i,:),1)) + 1;  %真的标号FN +1
      FP(find(L,1)) = FP(find(L,1)) + 1;  %识别出来的标号FP +1
      for j = 1: size(label,2)
         if j ~= find(label(i,:),1) &&  j ~= find(L,1)
             TN(j) = TN(j) + 1; %其余标号TN  +1
         end
      end
    end
end

recall = TP ./ (TP + FN);
precise = TP ./ (TP + FP);
specificity = TN ./(FP + TN);
ACC = (TP + TN) ./ (TP + TN + FP + FN);

disp ('OneTemplateClassify:');
disp ('recall:');
disp (recall );
disp ('precise:');
disp (precise);
disp ('specificity:');
disp (specificity );
disp ('ACC:');
disp (ACC);