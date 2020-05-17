function [result, net] = set_network_one(train_set, labels,no_neurons)
minmax_data = minmax(train_set)
net = newff(minmax_data,[no_neurons, 1], {'tansig', 'purelin'}, 'traingd');

net = initnw(net,1);
net = initnw(net,2);
% wagi_n_ukrytych=net.IW{1,1}
% bias_n_ukrytych=net.b{1}
% wagi_n_wyjsciowych=net.LW{2,1}
% bias_n_wyjsciowych=net.b{2}
net.trainParam.goal = 0.01;             %warunek stopu - poziom błędu
net.trainParam.epochs = 100;            %maksymalna liczba epok
%net.trainParam.showWindow = false;      %nie pokazywać okna z wykresami
                                           %w trakcie uczenia
net=train(net,train_set,labels); 
net.trainFcn = 'trainlm';
net.trainParam.goal = 0.01;             %warunek stopu - poziom błędu
net.trainParam.epochs = 200;            %maksymalna liczba epok
%net.trainParam.showWindow = false;      %nie pokazywać okna z wykresami
                                            %w trakcie uczenia
net=train(net,train_set,labels);
result=sim(net,train_set);
end