function [ FileOut ] = g_BeforeNormalize_MD_FileOut( NiiOutputPath,NumberOfSubject_String,dtifit_Prefix )
%
% FileOut contain all the files' full path of the job FAnormalize1 output 
% 3 files will be produced: _MD_4normalize.nii.gz, 
%                           _MD_4normalize_mask.nii.gz, .done 
% .done file is sign of the completion of the job
%
FileOut{1} = [NiiOutputPath NumberOfSubject_String filesep 'native_space' filesep dtifit_Prefix '_MD_4normalize.nii.gz' ];
FileOut{2} = [NiiOutputPath NumberOfSubject_String filesep 'native_space' filesep dtifit_Prefix '_MD_4normalize_mask.nii.gz' ];
