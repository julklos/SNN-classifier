data_train = importdata("./data/train_set.mat");
data_test = importdata("./data/test_set.mat");

var_count=2;
class_count=2;
sample_count_test=size(data_test,1)
data_norm = zeros(sample_count_train, var_count);

max_train = max(data_train(:,1:end-1));
min_train = min(data_train(:,1:end-1));
max_test = max(data_test(:,1:end-1));
min_test = min(data_test(:,1:end-1));
%normalizacja i centrowanie
for i=1:1:var_count,
    data_norm(:,i)=(data_train(:,i)-min_train(i))/(max_train(i)-min_train(i));
end    

data_centr=zeros(sample_count_train,var_count)
avg=zeros(var_count,1)

for i=1:1:var_count,
   avg(i)=mean(data_norm(:,i));
   data_centr(:,i)=data_norm(:,i)-avg(i);
end
labels = -1*ones(sample_count_train,var_count);
for i=1:1:sample_count_train
   labels(i,data_train(i,var_count+1))=1;
end

