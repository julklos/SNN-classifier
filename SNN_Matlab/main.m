% plik:  main.m 
% opis:  przyk�adowy skrypt pokazuj�cy u�ycie sieci neuronowych w 
%        programie MATLAB
% autor: Zbigniew Szyma�ski <z.szymanski@ii.pw.edu.pl>
% data:  2013-11-20

clc;        %wyczyszczenie okna komend Matlaba    
clear;      %czy�ci pami�� Matlaba

% Import danych z pliku tekstowego
dane=importdata('dane.txt');
% Opis tablicy 'dane':
% kolumny 1,2 - wsp�rz�dne punkt�w do klasyfikacji
% kolumna 3   - etykieta punktu {-1,1}
%{
wart_kl_poz=0.9;                %warto�ci etykiet u�ywane przy uczeniu
wart_kl_neg=-0.9;
idx_poz=find(dane(:,3)==1);     %indeksy punkt�w klasy pozytywnej
idx_neg=find(dane(:,3)==-1);    %indeksy punkt�w klasy negatywnej
dane(idx_poz,3)=wart_kl_poz;    %zmiana warto�ci etykiet klasy poz.
dane(idx_neg,3)=wart_kl_neg;    %zmiana warto�ci etykiet klasy neg.
%}
% Uczenie sieci neuronowej 
liczba_neuronow_ukrytych=4;
[net]=train_net(dane(:,1:2),dane(:,3),liczba_neuronow_ukrytych);
