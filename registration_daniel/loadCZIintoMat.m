function Images = loadCZIintoMat(filename)
% Input: Folder location. Output: Structure containing matlab images of all
% CZI files for each polarimetric measurement

ims.HB = showCZI([filename '\HB.czi']);
ims.HH = showCZI([filename '\HH.czi']);
ims.HL = showCZI([filename '\HL.czi']);
ims.HP = showCZI([filename '\HP.czi']);
ims.HR = showCZI([filename '\HR.czi']);
ims.HV = showCZI([filename '\HV.czi']);

ims.BB = showCZI([filename '\BB.czi']);
ims.BH = showCZI([filename '\BH.czi']);
ims.BL = showCZI([filename '\BL.czi']);
ims.BP = showCZI([filename '\BP.czi']);
ims.BR = showCZI([filename '\BR.czi']);
ims.BV = showCZI([filename '\BV.czi']);

ims.RB = showCZI([filename '\RB.czi']);
ims.RH = showCZI([filename '\RH.czi']);
ims.RL = showCZI([filename '\RL.czi']);
ims.RP = showCZI([filename '\RP.czi']);
ims.RR = showCZI([filename '\RR.czi']);
ims.RV = showCZI([filename '\RV.czi']);

ims.VB = showCZI([filename '\VB.czi']);
ims.VH = showCZI([filename '\VH.czi']);
ims.VL = showCZI([filename '\VL.czi']);
ims.VP = showCZI([filename '\VP.czi']);
ims.VR = showCZI([filename '\VR.czi']);
ims.VV = showCZI([filename '\VV.czi']);

Images = ims;

end

