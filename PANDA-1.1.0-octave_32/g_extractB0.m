
function g_extractB0( DWI_FileName,reference)
%
%__________________________________________________________________________
% SUMMARY OF G_EXTRACTB0
% 
% Extract a volume on a gradient direction from an 4D image.
% Default: extract b0 volume from an 4D image.
%
% SYNTAX:
%
% 1) g_extractB0( DWI_FileName )
% 2) g_extractB0( DWI_FileName,reference )
%__________________________________________________________________________
% INPUTS:
%
% DWI_FILENAME
%        (string) 
%        The full path of the NIfTI data.
%        For example: '/data/Handled_Data/001/DWI.nii'
%
% REFERENCE
%        (integer, default 0)
%        The start index of your ROI in time.
%__________________________________________________________________________
% OUTPUTS:
%
% B0 volume named data_b0.nii.gz.
% See g_extractB0_..._FileOut.m file.         
%__________________________________________________________________________
% COMMENTS:
%
% Copyright (c) Gaolang Gong, Zaixu Cui, State Key Laboratory of Cognitive
% Neuroscience and Learning, Beijing Normal University, 2011.
% See licensing information in the code
% keywords: fslroi, b0
% Please report bugs or requests to:
%   Zaixu Cui:         <a href="zaixucui@gmail.com">zaixucui@gmail.com</a>
%   Suyu Zhong:        <a href="suyu.zhong@gmail.com">suyu.zhong@gmail.com</a>
%   Gaolang Gong (PI): <a href="gaolang.gong@gmail.com">gaolang.gong@gmail.com</a>

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

if nargin < 2
    reference = 0;
end

[a,b,c] = fileparts(DWI_FileName);
saved_b0_FileName = [ a filesep 'data_b0.nii.gz'];
cmd = cat(2, 'fslroi ', DWI_FileName, ' ', saved_b0_FileName , ' ', num2str(reference), ' 1');
disp(cmd);
system(cmd);


