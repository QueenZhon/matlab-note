function file_path = getPath(startPath,targetFile)
%GETPATH Get get target file path
% file_path = getPath(startPath,targetFile) returns the whole path struct
% by adding all the subdirectories
% 
% Copyright 2017-10-19 CXZ
%------------------------------------------------------
pathc = genpath(startPath);
paths = split(pathc,';');
file_path = struct([]);
n = 1;
for k = 1:length(paths)
    dirs = dir(paths{k});
    for i=1:length(dirs)
        dirname = dirs(i).name;
        if ~strcmp( dirname,'.')  && ...
           ~strcmp( dirname,'..') && ...
            strcmp(dirname,targetFile)
%             file_path(n,:).path = fullfile(paths{k},targetFile);
            file_path(n,1).path = paths{k};
            n = n+1;
        end
    end
end
end