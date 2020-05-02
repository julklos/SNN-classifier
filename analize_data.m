clear all
train_filename = "zestaw_12-train_set.txt";
test_filename = "zestaw_12-test_set.txt";

[train_data,delimiterOut_train] = importdata(train_filename);
[test_data,delimiterOut_test] = importdata(test_filename);

var_count = 4;
class_count = 2;
sample_train_count=size(train_data,1);
sample_test_count=size(test_data,1);
idx_tr = find(train_data(:,5) == 2)
idx_test = find(test_data(:,5) == 2)
idx_tr_n = find(train_data(:,5) ~= 2)
idx_test_n = find(test_data(:,5) ~= 2)
Corr_Array_train = zeros(var_count, var_count);
Corr_Array_test = zeros(var_count, var_count);
for i = 1:var_count
    for j = 1:var_count
         if(i~=j)
             figure
             plot(train_data(idx_tr,i), train_data(idx_tr,j), 'r*'); hold on
             plot(train_data(idx_tr_n,i), train_data(idx_tr_n,j), 'g+');
             xlabel(sprintf('X%.f', i))
             ylabel(sprintf('X%.f', j))
             title('Dane uczące')
             Corr_Array_train(i,j) = corr(train_data(:,i), train_data(:,j));
             Corr_Array_test(i,j) = corr(test_data(:,i), test_data(:,j));
             figure 
             plot(test_data(idx_test,i), test_data(idx_test,j), 'r*'); hold on
             plot(test_data(idx_test_n,i),test_data(idx_test_n,j), 'g+')
             xlabel(sprintf('X%.f', i))
             ylabel(sprintf('X%.f', j))
             title('Dane testowe')
             
         end
    end
end