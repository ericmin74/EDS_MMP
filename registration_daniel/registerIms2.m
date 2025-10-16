function imsReg = registerIms2(tissueIms, transformStrucs, where2save, imcheck)
% Input: Struct of images, struct of transforms, file location for saving. 
% Output: Files saved, and a Structure containing matlab images of all
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

%% Establish parameters
Rfixed = imref2d(size(BB));
Rmoving = imref2d(size(BB));

%% Register everything to BB
tform = transformStrucs.movingRegBH.Transformation;
BHa = imwarp(BH, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegBL.Transformation;
BLa = imwarp(BL, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegBP.Transformation;
BPa = imwarp(BP, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegBR.Transformation;
BRa = imwarp(BR, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegBV.Transformation;
BVa = imwarp(BV, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegHB.Transformation;
HBa = imwarp(HB, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegHH.Transformation;
HHa = imwarp(HH, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegHL.Transformation;
HLa = imwarp(HL, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegHP.Transformation;
HPa = imwarp(HP, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegHR.Transformation;
HRa = imwarp(HR, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegHV.Transformation;
HVa = imwarp(HV, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegRB.Transformation;
RBa = imwarp(RB, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegRH.Transformation;
RHa = imwarp(RH, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegRL.Transformation;
RLa = imwarp(RL, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegRP.Transformation;
RPa = imwarp(RP, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegRR.Transformation;
RRa = imwarp(RR, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegRV.Transformation;
RVa = imwarp(RV, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegVB.Transformation;
VBa = imwarp(VB, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegVH.Transformation;
VHa = imwarp(VH, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegVL.Transformation;
VLa = imwarp(VL, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegVP.Transformation;
VPa = imwarp(VP, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegVR.Transformation;
VRa = imwarp(VR, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

tform = transformStrucs.movingRegVV.Transformation;
VVa = imwarp(VV, Rmoving, tform, 'OutputView', Rfixed, 'SmoothEdges', true);

if imcheck == 1
figure; subplot(1,2,1); imshowpair(BB,BH); subplot(1,2,2); imshowpair(BB,BHa); sgtitle('BH');
figure; subplot(1,2,1); imshowpair(BB,BL); subplot(1,2,2); imshowpair(BB,BLa); sgtitle('BL');
figure; subplot(1,2,1); imshowpair(BB,BP); subplot(1,2,2); imshowpair(BB,BPa); sgtitle('BP');
figure; subplot(1,2,1); imshowpair(BB,BR); subplot(1,2,2); imshowpair(BB,BRa); sgtitle('BR');
figure; subplot(1,2,1); imshowpair(BB,BV); subplot(1,2,2); imshowpair(BB,BVa); sgtitle('BV');
figure; subplot(1,2,1); imshowpair(BB,HB); subplot(1,2,2); imshowpair(BB,HBa); sgtitle('HB');
figure; subplot(1,2,1); imshowpair(BB,HH); subplot(1,2,2); imshowpair(BB,HHa); sgtitle('HH');
figure; subplot(1,2,1); imshowpair(BB,HL); subplot(1,2,2); imshowpair(BB,HLa); sgtitle('HL');
figure; subplot(1,2,1); imshowpair(BB,HP); subplot(1,2,2); imshowpair(BB,HPa); sgtitle('HP');
figure; subplot(1,2,1); imshowpair(BB,HR); subplot(1,2,2); imshowpair(BB,HRa); sgtitle('HR');
figure; subplot(1,2,1); imshowpair(BB,HV); subplot(1,2,2); imshowpair(BB,HVa); sgtitle('HV');
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
0;
end

%% Export all

imsReg.HB = HBa;
imsReg.HH = HHa;
imsReg.HL = HLa;
imsReg.HP = HPa;
imsReg.HR = HRa;
imsReg.HV = HVa;

imsReg.BB = BB;
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

