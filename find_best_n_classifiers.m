load("train_set.mat")
data = data';
minmax_data = minmax(data(1:end-2,:));
train_set = data(1:end-2,:);
class = 1;
labels1 = [class*(data(end-1,:)==1)];
labels2 = [class*(data(end-1,:)==-1)];
margin_up = (class)*0.6;
margin_down = (class)*0.4;
iterate = 2;

finalArray = zeros(3,10);
no = 3:4;
indx_cl1=find((labels1>margin_up)&(labels2<margin_down));
indx_cl2=find((labels1<margin_down)&(labels2>margin_up));
for k=1:length(no)
    corr = 0;
    err = 0;
    noth = 0;
    for j = 1:iterate
        
        [result_train1, net1] = set_network_one(train_set, labels1, no(k));
        [result_train2, net2] = set_network_one(train_set, labels2, no(k));
        
        indx_cl1_net=find((result_train1>margin_up)&(result_train2<margin_down));
        indx_cl2_net=find((result_train1<margin_down)&(result_train2>margin_up));
        
        [cor1, er1, not1 ] = getStatistics(indx_cl1, indx_cl1_net,indx_cl2_net)
        [cor2, er2, not2 ] = getStatistics(indx_cl2, indx_cl2_net,indx_cl1_net)
        err = err + er1 + er2;
        corr = corr + cor1 + cor2;
        noth = noth + not1 + not2;



    end
      finalArray(:,k)= [corr, err, noth]./iterate;

end

