% plik:  main.m 
% opis:  przyk³adowy skrypt pokazuj¹cy u¿ycie sieci neuronowych w 
%        programie MATLAB
% autor: Zbigniew Szymañski <z.szymanski@ii.pw.edu.pl>
% data:  2013-11-20

clc;        %wyczyszczenie okna komend Matlaba    
clear;      %czyœci pamiêæ Matlaba

% Import danych z pliku tekstowego
dane=importdata('dane.txt');
% Opis tablicy 'dane':
% kolumny 1,2 - wspó³rzêdne punktów do klasyfikacji
% kolumna 3   - etykieta punktu {-1,1}
%{
wart_kl_poz=0.9;                %wartoœci etykiet u¿ywane przy uczeniu
wart_kl_neg=-0.9;
idx_poz=find(dane(:,3)==1);     %indeksy punktów klasy pozytywnej
idx_neg=find(dane(:,3)==-1);    %indeksy punktów klasy negatywnej
dane(idx_poz,3)=wart_kl_poz;    %zmiana wartoœci etykiet klasy poz.
dane(idx_neg,3)=wart_kl_neg;    %zmiana wartoœci etykiet klasy neg.
%}
% Uczenie sieci neuronowej 
liczba_neuronow_ukrytych=4;
[net]=train_net(dane(:,1:2),dane(:,3),liczba_neuronow_ukrytych);
