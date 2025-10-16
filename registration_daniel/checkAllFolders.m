%Recurse down every folder, find the czis and save MM for each in each
%folder.

A = '*';

processFolders(A)

function nextFolderName = processFolders(directoryName)

    files = dir(directoryName);
    % % Get a logical vector that tells which is a directory.
    % dirFlags = [files.isdir];
    % Extract only those that are directories.
    subFolders = files([files.isdir]); % A structure with extra info.
    cziFiles =files(~[files.isdir]);
    % Get only the folder names into a cell array.
    if length(subFolders)>=3 %if there are still subfolders...
       
        subFolderNames = {subFolders(3:end).name}; % get all the subfolder names
        
        for i = 1:length(subFolderNames) %in each subfolder...
            nextFolderName = [subFolders(1).folder '\' subFolderNames{i}]; %pick the next subfolder
            processFolders(nextFolderName); % go to the next subfolder
        end
    else %if there are nomore subfolders...
            % Get location name
            cziLocation = cziFiles(end).folder;

            % Load the blank images
            MMIms = loadCZIintoMat(cziLocation);

            % Calculate the Mueller Matrix for the blank slide
            MMImage = getMMfromIms(MMIms);

            % Save the MM array as a retrievable
            save(strcat(cziLocation,"\MMImage.mat"), "MMImage");
      
    end

end