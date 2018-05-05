%% taking an image
clc;
clear all;
close all;
[fname path]=uigetfile('.jpg','PROVIDE A SUSPECTED FACE');
fname=strcat(path,fname);
im=imread(fname);
%im=rgb2gray(im);
imshow(im);
title('Test face');
%% find the face it belongs
Ftest=FeatureStatistical(im);
%% compare with database 
load database;
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for i=1:size(Ftrain,1)
    dist(i,:)=sum(abs(Ftrain(i,:)-Ftest));
end
Min=min(dist);
if (Min<15)
n=find(dist==min(dist),1);
detected_class=Ctrain(n);
msgbox(strcat('Detected class',num2str(detected_class)));
else
 msgbox('This person is not registered');  
end