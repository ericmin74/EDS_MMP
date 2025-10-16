% Done 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18
% To do:19

i = 19; %19 total
string(subFolderNames(i))
fileLocation = convertStringsToChars(strcat(cd, '\', string(subFolderNames(i))));   
load(strcat(fileLocation,"\ImStruc.mat"));

BB = tissueIms.BB;
BH = tissueIms.BH;
BL = tissueIms.BL;
BP = tissueIms.BP;
BPa = BP*100; 
BR = tissueIms.BR;
BV = tissueIms.BV;

HB = tissueIms.HB;
HH = tissueIms.HH;
HL = tissueIms.HL;
HP = tissueIms.HP;
HR = tissueIms.HR;
HV = tissueIms.HV;
HVa = HV*100; 

RB = tissueIms.HB;
RH = tissueIms.RH;
RL = tissueIms.RL;
RLa = RL*20; 
RP = tissueIms.RP;
RR = tissueIms.RR;
RV = tissueIms.RV;

VB = tissueIms.VB;
VH = tissueIms.VH;
VHa = VH*100; 
VL = tissueIms.VL;
VP = tissueIms.VP;
VR = tissueIms.VR;
VV = tissueIms.VV;

figure;
imshow(BPa)
figure;
imshow(HVa)
figure;
imshow(RLa)
figure;
imshow(VHa)

%% Confirm Manual Registration
% Rfixed = imref2d(size(BB));
% Rmoving = imref2d(size(BB));
% 
% tform = movingRegVH.Transformation;
% %%
% VHt = imwarp(VHa, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);
% imshowpair(BB,VHt)