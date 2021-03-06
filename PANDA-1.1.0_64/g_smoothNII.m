
function g_smoothNII( fileName,kernel_size,JobName )
%
%__________________________________________________________________________
% SUMMARY OF G_SMOOTHNII
% 
% Smooth the image data 
%
% SYNTAX:
% G_SMOOTHNII( FILENAME,KERNEL_SIZE,JOBNAME )
%__________________________________________________________________________
% INPUTS:
%
% FILENAME
%        (string) the full path of the NIfTI data
%        For example: '/data/Handled_Data/001/001_FA_to_target_2mm.nii.gz'
%
% KERNEL_SIZE
%        (single) smoothing kernel size 
%
% JOBNAME
%        (string) the name of the job which call the command this time.It
%        is determined in the function g_dti_pipeline.
%        If you use this function alone, this parameter is not needed.
%__________________________________________________________________________
% OUTPUTS:
%    
% See g_smoothNII_2_FileOut.m file
%__________________________________________________________________________
% USAGES:
%
%        1) g_smoothNII( fileName,kernel_size )
%        2) g_smoothNII( fileName,kernel_size,JobName )
%__________________________________________________________________________
% COMMENTS:
%
% Copyright (c) Gaolang Gong, Zaixu Cui, State Key Laboratory of Cognitive
% Neuroscience and Learning, Beijing Normal University, 2011.
% Maintainer: zaixucui@gmail.com
% See licensing information in the code
% keywords: fslmaths

% Permission is hereby granted, free of charge, to any person obtaining a
% copy of this software and associated documation files, to deal in the
% Software without restriction, including without limitation the rights to
% use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included
% in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
% NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
% DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
% OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
% USE OR OTHER DEALINGS IN THE SOFTWARE.

suffix = ['s' num2str(kernel_size) 'mm'];
[num_subjects, num_images] = size(fileName);
Sigma = kernel_size/2.3548;

if strcmp(fileName(end - 6:end), '.nii.gz')
    smoothed_fileName = cat(2,fileName(1:end - 7),'_',suffix);
elseif strcmp(fileName(end - 3:end), '.nii');
    smoothed_fileName = cat(2,fileName(1:end - 4),'_',suffix);
else
    error('not a NIFTI file');
end

cmd = cat(2, 'fslmaths ', fileName, ' -s ',num2str(Sigma), ' ', smoothed_fileName);
disp(cmd);
system(cmd);

if nargin == 3
    [a,b,c] = fileparts(fileName);
    [SubjectFolder,b,c] = fileparts(a);
    cmd = ['touch ' SubjectFolder filesep 'tmp' filesep 'OutputDone' filesep JobName '.done '];
    system(cmd);
end
