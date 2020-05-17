load("train_set.mat")
data = data';
train_set = data(1:end-2,:);
minmax_data = minmax(data(1:end-2,:));
class = 1;
labels1 = [class*(data(end-1,:)==1)];
labels2 = [class*(data(end-1,:)==-1)];
margin_up = (class)*0.6;
margin_down = (class)*0.4;
no = 6;

indx_cl1=find((labels1>margin_up)&(labels2<margin_down));
indx_cl2=find((labels1<margin_down)&(labels2>margin_up));

[result_train1, net1] = set_network_one(train_set, labels1, no);
[result_train2, net2] = set_network_one(train_set, labels2, no);
        
indx_cl1_net=find((result_train1>margin_up)&(result_train2<margin_down));
indx_cl2_net=find((result_train1<margin_down)&(result_train2>margin_up));
[cor1, er1, not1 ] = getStatistics(indx_cl1, indx_cl1_net,indx_cl2_net)
[cor2, er2, not2 ] = getStatistics(indx_cl2, indx_cl2_net,indx_cl1_net)

err_train =  er1 + er2;
corr_train =  cor1 + cor2;
noth_train =  not1 + not2;

weight_n_hidden1 =net1.IW{1,1}
bias_n_hidden1=net1.b{1}
weight_n_out1=net1.LW{2,1}
bias_n_out1=net1.b{2}

weight_n_hidden2 =net2.IW{1,1}
bias_n_hidden2=net2.b{1}
weight_n_out2=net2.LW{2,1}
bias_n_out2=net2.b{2}

tp_train = cor1;
tn_train = cor2;
fp_train = er1;
fn_train = er2;

recall_train = tp_train / (tp_train + fn_train);
false_alarm_train = fp_train / (fp_train + tn_train);
precision_train = tp_train/ (tp_train + fp_train);
accuracy_train = (tp_train + tn_train)/ length(data(end,:));
specifity_train = tn_train/(fp_train+tn_train);

load("./data/test_set.mat")
data = data';
test_set = data(1:end-1,:);
labels1_test = [class*(data(end,:)==1)];
labels2_test = [class*(data(end,:)==2)];

indx_cl1_test=find((labels1_test>margin_up)&(labels2_test<margin_down));
indx_cl2_test=find((labels1_test<margin_down)&(labels2_test>margin_up));

result1_test=sim(net1,test_set);
result2_test=sim(net2,test_set);

indx_cl1_net_test=find((result1_test>margin_up)&(result2_test<margin_down));
indx_cl2_net_test=find((result1_test<margin_down)&(result2_test>margin_up));

[cor1_t, er1_t, not1_t ] = getStatistics(indx_cl1_test, indx_cl1_net_test,indx_cl2_net_test);
[cor2_t, er2_t, not2_t ] = getStatistics(indx_cl2_test, indx_cl2_net_test,indx_cl1_net_test);
err_test =  er1_t + er2_t;
corr_test =  cor1_t + cor2_t;
noth_test =  not1_t + not2_t;
tp_test = cor1_t;
tn_test = cor2_t;
fp_test = er1_t;
fn_test = er2_t;

recall_test = tp_test / (tp_test + fn_test);
false_alarm_test = fp_test / (fp_test + tn_test);
precision_test = tp_test/ (tp_test + fp_test);
accuracy_test = (tp_test + tn_test)/ length(data(end,:));
specifity_test = tn_test/(fp_test+tn_test);