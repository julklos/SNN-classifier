load("train_set.mat")
data = data';
minmax_data = minmax(data(1:end-2,:));
train_set = data(1:end-2,:);
%labels = 0.9*data(end-1:end,:);
class = 1;
labels = [class*(data(end-1,:)==1); class*(data(end-1,:)==-1)+0.1];
margin_up = (class)*0.6;
margin_down = (class)*0.4;
iterate = 20;
finalArray = zeros(3,10);
no = 3:10;
indx_cl1=find((labels(1,:)>margin_up)&(labels(2,:)<margin_down));
indx_cl2=find((labels(1,:)<margin_down)&(labels(2,:)>margin_up));
for k=1:length(no)
    corr = 0;
    err = 0;
    noth = 0;
    for j = 1:iterate
        
        [result_train, net] = set_network(train_set, labels, no(k));
        indx_cl1_net=find((result_train(1,:)>margin_up)&(result_train(2,:)<margin_down));
        indx_cl2_net=find((result_train(1,:)<margin_down)&(result_train(2,:)>margin_up));
        
        [cor1, er1, not1 ] = getStatistics(indx_cl1, indx_cl1_net,indx_cl2_net)
        [cor2, er2, not2 ] = getStatistics(indx_cl2, indx_cl2_net,indx_cl1_net)
        err = err + er1 + er2;
        corr = corr + cor1 + cor2;
        noth = noth + not1 + not2;



    end
         finalArray(:,k)= [corr, err, noth]./iterate;

end

