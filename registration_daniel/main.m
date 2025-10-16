% Goal: Get Stokes data for each image set

folderName1 = 'April 3 2025';
folderName2 = 'April 4 2025';

% 1) Find the 'blank' folder and save MM image

% blankLocation = [cd '\' folderName1 '\blank'];
% blankIms = loadCZIintoMat(blankLocation);
% save(strcat(blankLocation,"\ImStruc.mat"), "blankIms");
% blankMMI = getMMfromIms(blankIms);
% save(strcat(blankLocation,"\MMImage.mat"), "blankMMI");

% blankLocation = [cd '\' folderName2 '\blank'];
% blankIms = loadCZIintoMat(blankLocation);
% save(strcat(blankLocation,"\ImStruc.mat"), "blankIms");
% blankMMI = getMMfromIms(blankIms);
% save(strcat(blankLocation,"\MMImage.mat"), "blankMMI");

blankFolderNames = [{'April 3 2025\blank'}; {'April 4 2025\blank'}];

% 2) Get all folders with experimental data

filesCEDS1 = dir([cd '\' folderName1 '\CEDS']);
subFolderNamesCEDS1 = strcat(folderName1, '\CEDS\', {filesCEDS1(3:end).name});

filesHEDS1 = dir([cd '\' folderName1 '\HEDS']);
subFolderNamesHEDS1 = strcat(folderName1, '\HEDS\', {filesHEDS1(3:end).name});

filesHealthy1 = dir([cd '\' folderName1 '\healthy']);
subFolderNamesHealthy1 = strcat(folderName1, '\healthy\', {filesHealthy1(3:end).name});

filesHEDS2 = dir([cd '\' folderName2 '\HEDS']);
subFolderNamesHEDS2 = strcat(folderName2 , '\HEDS\', {filesHEDS2(3:end).name});

subFolderNames1 = [subFolderNamesCEDS1 subFolderNamesHEDS1 subFolderNamesHealthy1]';
subFolderNames2 = [subFolderNamesHEDS2 {'April 4 2025\P8'}]';

subFolderNames = [subFolderNames1;subFolderNames2];



%% 3) Iterate into folders, and convert all CZI to a matlab structure of images

for i = 1:length(subFolderNames1)

    fileLocation = convertStringsToChars(strcat(cd, '\', string(subFolderNames1(i))));

    tissueIms = loadCZIintoMat(fileLocation);

    save(strcat(fileLocation,"\ImStruc.mat"), "tissueIms");

end

for i = 1:length(subFolderNames2)

    fileLocation = convertStringsToChars(strcat(cd, '\', string(subFolderNames2(i))));

    tissueIms = loadCZIintoMat(fileLocation);

    save(strcat(fileLocation,"\ImStruc.mat"), "tissueIms");

end

%% ) Registration and saving of intensity images as tif

% Version 2

for i = 1:length(subFolderNames)
    fileLocation = convertStringsToChars(strcat(cd, '\', string(subFolderNames(i))));   
    load(strcat(fileLocation,"\ImStruc.mat"));
    transformStrucs = load(strcat(fileLocation,"\registrationTransformation.mat"));

    %Register and save

    [status, msg, msgID] = mkdir(strcat(cd,'\Registered\', char(subFolderNames(i))));

    imsReg = registerIms2(tissueIms, transformStrucs,strcat(cd, "\Registered\", char(subFolderNames(i))),1);
    save(strcat(fileLocation,"\ImStrucReg.mat"), "imsReg");
end  

for i = 1:length(subFolderNames)
    blankFileLocation = convertStringsToChars(strcat(cd, '\', string(blankFolderNames(1))));   
    load(strcat(blankFileLocation,"\ImStruc.mat"));

    fileLocation = convertStringsToChars(strcat(cd, '\', string(subFolderNames(i))));
    transformStrucs = load(strcat(fileLocation,"\registrationTransformation.mat"));

    %Register and save

    [status, msg, msgID] = mkdir(strcat(cd,'\Registered\', char(subFolderNames(i)), '\blank'));

    imsReg = registerIms2(blankIms, transformStrucs,strcat(cd, "\Registered\", char(subFolderNames(i)), '\blank'),0);
    % save(strcat(fileLocation,"\ImStrucReg.mat"), "imsReg");
end

%% 3) Iterate into folders, and convert all TIF to a matlab structure of images

for i = 1:length(subFolderNames)

    fileLocation = convertStringsToChars(strcat(cd, '\Registered\', string(subFolderNames(i))));
    blankLocation = convertStringsToChars(strcat(cd, '\Registered\', string(subFolderNames(i)), '\blank'));

    tissueIms = loadTIFintoMat(fileLocation);
    blankIms = loadTIFintoMat(blankLocation);

    save(strcat(fileLocation,"\ImStruc.mat"), "tissueIms");
    save(strcat(blankLocation,"\ImStruc.mat"), "blankIms");

end

%% 4) Remove Blanks

%Blank Removal
for i = 1:length(subFolderNames)
    fileLocation = convertStringsToChars(strcat(cd, '\Registered\', string(subFolderNames(i))));
    blankLocation = convertStringsToChars(strcat(cd, '\Registered\', string(subFolderNames(i)), '\blank'));

    load(strcat(fileLocation,"\ImStruc.mat"));

    load(strcat(blankLocation,"\ImStruc.mat"));

    %Subtract Blanks
    imsNoBlanks = removeBlanks(blankIms,tissueIms);
    save(strcat(fileLocation,"\ImStrucBlankRemoved.mat"), "imsNoBlanks");
end



%% Show Intensity Images (check for blur)

for i = 1:length(subFolderNames)
    sample = load([cd, '\Registered\', char(subFolderNames(i)), '\ImStrucBlankRemoved.mat']);
    
    figure;
    imshow(showMMintensity(sample.imsNoBlanks));
    
    title(subFolderNames(i));
end

%% ) Calculate the MM data

for i = 1:length(subFolderNames)

    fileLocation = convertStringsToChars(strcat(cd, '\Registered\', string(subFolderNames(i))));

    load(strcat(fileLocation,"\ImStrucBlankRemoved.mat"));

    tissueMMI = getMMfromIms(imsNoBlanks);

    save(strcat(fileLocation,"\MMImage.mat"), "tissueMMI");

end


%% ) Show MM Images

for i = 1:length(subFolderNames)
    sampleName = char(subFolderNames(i));
    
    imageFile = load([cd '\Registered\' sampleName '\MMImage.mat']);
    
    showMMimages(imageFile.tissueMMI)
    
    % %Add Intensity Average
    % sample = load([cd, '\', char(subFolderNames(i)), '\ImStrucReg.mat']);
    % 
    % hold on;
    % subplot(4,4,1)
    % imshow(showMMintensity(sample.imsReg));
    % title('m11');
    
    sgtitle(subFolderNames(i))
end


%% ) Decompose Mueller matrix - Create birefringence image


sampleName = char(subFolderNames(1));
    
imageFile = load([cd '\' sampleName '\MMImage.mat']);

MMimage = imageFile.tissueMMI;

imSize = length(MMimage);

imTotalDiattenuation = zeros(imSize);
imLinearDiattenuation = zeros(imSize);
imCircularDiattenuation = zeros(imSize);
imPolarizance = zeros(imSize);
imTotalDepolarization = zeros(imSize);
imTotalRetardance = zeros(imSize);
imOpticalRotation = zeros(imSize);
imLinearRetardance = zeros(imSize);


for i = 1:imSize
    for j = 1:imSize

        m11 = MMimage(i,j,1);
        m12 = MMimage(i,j,2);
        m13 = MMimage(i,j,3);
        m14 = MMimage(i,j,4);
        m21 = MMimage(i,j,5);
        m22 = MMimage(i,j,6);
        m23 = MMimage(i,j,7);
        m24 = MMimage(i,j,8);
        m31 = MMimage(i,j,9);
        m32 = MMimage(i,j,10);
        m33 = MMimage(i,j,11);
        m34 = MMimage(i,j,12);
        m41 = MMimage(i,j,13);
        m42 = MMimage(i,j,14);
        m43 = MMimage(i,j,15);
        m44 = MMimage(i,j,16);

        MM = [ m11 m12 m13 m14;
               m21 m22 m23 m24;
               m31 m32 m33 m34;   
               m41 m42 m43 m44];

        m3x3 = [ m22 m23 m24;
                 m32 m33 m34;   
                 m42 m43 m44];
        
        %Polarizance Vector(3x1)
        vP = MM(2:4,1);
             
        %Diattenuation vector (1x3)
        vD = MM(1,2:4)';
        
        %Degree of Diattenuation (Scalar)****
        D = (1/m11)*sqrt(m12^2 + m13^2 + m14^2);

        imTotalDiattenuation(i,j) = D;
        
        %Diattenuation Matrix (3x3)
        mD = sqrt(1-D^2)*eye(3)+(1-sqrt(1-D^2))*((vD/norm(vD))*(vD'/norm(vD)));
        
        %Diattenuation Mueller Matrix (4x4)
        MMD = m11* [  1    vD(1)    vD(2)   vD(3) ;
                    vD(1) mD(1,1)  mD(1,2) mD(1,3);
                    vD(2) mD(2,1)  mD(2,2) mD(3,3);
                    vD(3) mD(3,1)  mD(3,2) mD(3,3)];
        
        %Polarizance Matrix Vector (3x1)
        vmP = (vP-m3x3*vD)/(1-D^2);
        
        %Degree of Polarizance (scalar)****
        P = norm(vmP);

        imPolarizance(i,j) = P;
        
        mPmR = MM*MMD^-1;
        mPmR = mPmR(2:4,2:4);
        
        %Polar Decomposition
        [tW,tS,tV] = svd(mPmR); %singular value decomposition
        
        mP = tW*tS*tW';  %the symmetric matrix
        mR = tW*tV';     %the unitary rotation matrix
        
        %Polarizance Mueller Matrix (4x4)
        MMP = [  1       0       0       0   ;
               vmP(1) mP(1,1) mP(1,2) mP(1,3);
               vmP(2) mP(2,1) mP(2,2) mP(3,3);
               vmP(3) mP(3,1) mP(3,2) mP(3,3)];
        
        %Degree of Depolarization (scalar)****
        DOD = 1-(1/3)*trace(mP);

        imTotalDepolarization(i,j) = DOD;
           
        %Retardance Mueller Matrix (4x4)
        MMR = [  1       0       0       0   ;
                 0    mR(1,1) mR(1,2) mR(1,3);
                 0    mR(2,1) mR(2,2) mR(3,3);
                 0    mR(3,1) mR(3,2) mR(3,3)];
             
        %Total Retardance (Scalar)****
        R = acos((1/2)*trace(MMR)-1);

        imTotalRetardance(i,j) = R;

        imOpticalRotation(i,j) = atan((MMR(3,2) - MMR(2,3))/(MMR(2,2) + MMR(3,3)));

        imLinearRetardance(i,j) = acos(sqrt((MMR(2,2) + MMR(3,3))^2 + (MMR(3,2) - MMR(2,3)^2))-1);
        
        % %Linear retardance angle
        % LRA = deg2rad(acos(sqrt((MMR(2,2)+MMR(3,3))^2+(MMR(3,2)+MMR(2,3)^2))-1));
        % 
        % %Circular retardance angle
        % CRA = deg2rad(atan((MMR(3,2)-MMR(2,3))/(MMR(2,2)+MMR(3,3))));


    end
end

% 7) Show Images

figure;

subplot(2,2,1);
imshow(imTotalDepolarization)
title('Depolarization')

subplot(2,2,2);
imshow(imPolarizance)
title('Polarizance')

subplot(2,2,3);
imshow(imTotalDiattenuation)
title('Diattenuation')

subplot(2,2,4);
imshow(imTotalRetardance)
title('Retardance')

colormap(hot)

subplot(1,2,1);
imshow(imLinearRetardance)
title('Linear Retardance')

subplot(1,2,2);
imshow(imOpticalRotation)
title('Optical Rotation')

colormap(hot)