function Images = loadTIFintoMat(filename)
% Input: Folder location. Output: Structure containing matlab images of all
% CZI files for each polarimetric measurement

ims.HB = imread([filename '\HB.tif']);
ims.HH = imread([filename '\HH.tif']);
ims.HL = imread([filename '\HL.tif']);
ims.HP = imread([filename '\HP.tif']);
ims.HR = imread([filename '\HR.tif']);
ims.HV = imread([filename '\HV.tif']);

ims.BB = imread([filename '\BB.tif']);
ims.BH = imread([filename '\BH.tif']);
ims.BL = imread([filename '\BL.tif']);
ims.BP = imread([filename '\BP.tif']);
ims.BR = imread([filename '\BR.tif']);
ims.BV = imread([filename '\BV.tif']);

ims.RB = imread([filename '\RB.tif']);
ims.RH = imread([filename '\RH.tif']);
ims.RL = imread([filename '\RL.tif']);
ims.RP = imread([filename '\RP.tif']);
ims.RR = imread([filename '\RR.tif']);
ims.RV = imread([filename '\RV.tif']);

ims.VB = imread([filename '\VB.tif']);
ims.VH = imread([filename '\VH.tif']);
ims.VL = imread([filename '\VL.tif']);
ims.VP = imread([filename '\VP.tif']);
ims.VR = imread([filename '\VR.tif']);
ims.VV = imread([filename '\VV.tif']);

Images = ims;

end

