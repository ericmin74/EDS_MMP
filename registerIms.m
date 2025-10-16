function imsReg = registerIms(tissueIms, where2save)
% Input: Folder location. Output: Structure containing matlab images of all
% CZI files for each polarimetric measurement

HB = tissueIms.HB;
HH = tissueIms.HH;
HL = tissueIms.HL;
HP = tissueIms.HP;
HR = tissueIms.HR;
HV = tissueIms.HV;

BB = tissueIms.BB;
BH = tissueIms.BH;
BL = tissueIms.BL;
BP = tissueIms.BP;
BR = tissueIms.BR;
BV = tissueIms.BV;

RB = tissueIms.HB;
RH = tissueIms.RH;
RL = tissueIms.RL;
RP = tissueIms.RP;
RR = tissueIms.RR;
RV = tissueIms.RV;

VB = tissueIms.VB;
VH = tissueIms.VH;
VL = tissueIms.VL;
VP = tissueIms.VP;
VR = tissueIms.VR;
VV = tissueIms.VV;

% Set Registration params

[optimizer,metric] = imregconfig("multimodal");

optimizer.InitialRadius = 0.009;
optimizer.Epsilon = 1.5e-4;
optimizer.GrowthFactor = 1.01;
optimizer.MaximumIterations = 300;

% Register everything to BB

HHa = imregister(HH,BB,"translation", optimizer, metric);
HBa = imregister(HB,BB,"translation", optimizer, metric);
HLa = imregister(HL,BB,"translation", optimizer, metric);
HPa = imregister(HP,BB,"translation", optimizer, metric);
HRa = imregister(HR,BB,"translation", optimizer, metric);
HVa = imregister(HV,BB,"translation", optimizer, metric);

BBa = BB;
BHa = imregister(BH,BB,"translation", optimizer, metric);
BLa = imregister(BL,BB,"translation", optimizer, metric);
BPa = imregister(BP,BB,"translation", optimizer, metric);
BRa = imregister(BR,BB,"translation", optimizer, metric);
BVa = imregister(BV,BB,"translation", optimizer, metric);

RBa = imregister(RB,BB,"translation", optimizer, metric);
RHa = imregister(RH,BB,"translation", optimizer, metric);
RLa = imregister(RL,BB,"translation", optimizer, metric);
RPa = imregister(RP,BB,"translation", optimizer, metric);
RRa = imregister(RR,BB,"translation", optimizer, metric);
RVa = imregister(RV,BB,"translation", optimizer, metric);

VBa = imregister(VB,BB,"translation", optimizer, metric);
VHa = imregister(VH,BB,"translation", optimizer, metric);
VPa = imregister(VP,BB,"translation", optimizer, metric);
VLa = imregister(VL,BB,"translation", optimizer, metric);
VRa = imregister(VR,BB,"translation", optimizer, metric);
VVa = imregister(VV,BB,"translation", optimizer, metric);

figure; subplot(1,2,1); imshowpair(BB,HH); subplot(1,2,2); imshowpair(BB,HHa); sgtitle('HH');
figure; subplot(1,2,1); imshowpair(BB,HB); subplot(1,2,2); imshowpair(BB,HBa); sgtitle('HB');
figure; subplot(1,2,1); imshowpair(BB,HL); subplot(1,2,2); imshowpair(BB,HLa); sgtitle('HL');
figure; subplot(1,2,1); imshowpair(BB,HP); subplot(1,2,2); imshowpair(BB,HPa); sgtitle('HP');
figure; subplot(1,2,1); imshowpair(BB,HR); subplot(1,2,2); imshowpair(BB,HRa); sgtitle('HR');
figure; subplot(1,2,1); imshowpair(BB,HV); subplot(1,2,2); imshowpair(BB,HVa); sgtitle('HV');
figure; subplot(1,2,1); imshowpair(BB,BH); subplot(1,2,2); imshowpair(BB,BHa); sgtitle('BH');
figure; subplot(1,2,1); imshowpair(BB,BL); subplot(1,2,2); imshowpair(BB,BLa); sgtitle('BL');
figure; subplot(1,2,1); imshowpair(BB,BP); subplot(1,2,2); imshowpair(BB,BPa); sgtitle('BP');
figure; subplot(1,2,1); imshowpair(BB,BR); subplot(1,2,2); imshowpair(BB,BRa); sgtitle('BR');
figure; subplot(1,2,1); imshowpair(BB,BV); subplot(1,2,2); imshowpair(BB,BVa); sgtitle('BV');
figure; subplot(1,2,1); imshowpair(BB,RB); subplot(1,2,2); imshowpair(BB,RBa); sgtitle('RB');
figure; subplot(1,2,1); imshowpair(BB,RH); subplot(1,2,2); imshowpair(BB,RHa); sgtitle('RH');
figure; subplot(1,2,1); imshowpair(BB,RL); subplot(1,2,2); imshowpair(BB,RLa); sgtitle('RL');
figure; subplot(1,2,1); imshowpair(BB,RP); subplot(1,2,2); imshowpair(BB,RPa); sgtitle('RP');
figure; subplot(1,2,1); imshowpair(BB,RR); subplot(1,2,2); imshowpair(BB,RRa); sgtitle('RR');
figure; subplot(1,2,1); imshowpair(BB,RV); subplot(1,2,2); imshowpair(BB,RVa); sgtitle('RV');
figure; subplot(1,2,1); imshowpair(BB,VB); subplot(1,2,2); imshowpair(BB,VBa); sgtitle('VB');
figure; subplot(1,2,1); imshowpair(BB,VH); subplot(1,2,2); imshowpair(BB,VHa); sgtitle('VH');
figure; subplot(1,2,1); imshowpair(BB,VL); subplot(1,2,2); imshowpair(BB,VLa); sgtitle('VL');
figure; subplot(1,2,1); imshowpair(BB,VP); subplot(1,2,2); imshowpair(BB,VPa); sgtitle('VP');
figure; subplot(1,2,1); imshowpair(BB,VR); subplot(1,2,2); imshowpair(BB,VRa); sgtitle('VR');
figure; subplot(1,2,1); imshowpair(BB,VV); subplot(1,2,2); imshowpair(BB,VVa); sgtitle('VV');


%% Export all

imsReg.HB = HBa;
imsReg.HH = HHa;
imsReg.HL = HLa;
imsReg.HP = HPa;
imsReg.HR = HRa;
imsReg.HV = HVa;

imsReg.BB = BBa;
imsReg.BH = BHa;
imsReg.BL = BLa;
imsReg.BP = BPa;
imsReg.BR = BRa;
imsReg.BV = BVa;

imsReg.RB = RBa;
imsReg.RH = RHa;
imsReg.RL = RLa;
imsReg.RP = RPa;
imsReg.RR = RRa;
imsReg.RV = RVa;

imsReg.VB = VBa;
imsReg.VH = VHa;
imsReg.VL = VLa;
imsReg.VP = VPa;
imsReg.VR = VRa;
imsReg.VV = VVa;

imwrite(HBa,strcat(where2save,"\HB.tif"),"tif")
imwrite(HHa,strcat(where2save,"\HH.tif"),"tif")
imwrite(HLa,strcat(where2save,"\HL.tif"),"tif")
imwrite(HPa,strcat(where2save,"\HP.tif"),"tif")
imwrite(HRa,strcat(where2save,"\HR.tif"),"tif")
imwrite(HVa,strcat(where2save,"\HV.tif"),"tif")

imwrite(BB,strcat(where2save,"\BB.tif"),"tif")
imwrite(BHa,strcat(where2save,"\BH.tif"),"tif")
imwrite(BLa,strcat(where2save,"\BL.tif"),"tif")
imwrite(BPa,strcat(where2save,"\BP.tif"),"tif")
imwrite(BRa,strcat(where2save,"\BR.tif"),"tif")
imwrite(BVa,strcat(where2save,"\BV.tif"),"tif")

imwrite(RBa,strcat(where2save,"\RB.tif"),"tif")
imwrite(RHa,strcat(where2save,"\RH.tif"),"tif")
imwrite(RLa,strcat(where2save,"\RL.tif"),"tif")
imwrite(RPa,strcat(where2save,"\RP.tif"),"tif")
imwrite(RRa,strcat(where2save,"\RR.tif"),"tif")
imwrite(RVa,strcat(where2save,"\RV.tif"),"tif")

imwrite(VBa,strcat(where2save,"\VB.tif"),"tif")
imwrite(VHa,strcat(where2save,"\VH.tif"),"tif")
imwrite(VLa,strcat(where2save,"\VL.tif"),"tif")
imwrite(VPa,strcat(where2save,"\VP.tif"),"tif")
imwrite(VRa,strcat(where2save,"\VR.tif"),"tif")
imwrite(VVa,strcat(where2save,"\VV.tif"),"tif")

end

