

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% This code is used for changing the foldernames of ImageNet Datasets to
%%%% MATLAB default class names, which help users to avoid any
%%%% discrepancies during the training process. Since the raw downloaded
%%%% data of ImageNet dataset is disordered this code can be a handy tool
%%%% for all MATLAB users work in the deep learning domain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
close all
clear 

%% Loading pre-determined tables that contain MATLAB default classes and ImageNet default classes


% Loading the table that contains ImageNet classes and MATLAB classes; Note
% that the infomation in the table is already verified so you can use it
% straightforward
load('...\ImageNet_Classes_LablesAndIndex.mat')
load('...\ImageNetLabelsMappingInfo.mat')


% Remove Redundant Rows
ToDelete = LabelsMappingInfo.num_train_images == 0;
LabelsMappingInfo(ToDelete, :) = [];

% Extract default ImageNet classes and foldernames info
foldernames_and_labels = LabelsMappingInfo(:,2:3);

% Sort them alphabetically
c_table = sortrows(c_table, "ImageNet_Classes");
foldernames_and_labels = sortrows(foldernames_and_labels, "words");

% Load trainingset folder
trainingset_folder = fullfile("...\ILSVRC\Data\CLS-LOC\train");


% An extra step to make sure the indices info is correct
if sum(strcmpi(string(c_table{:,3}), string(foldernames_and_labels{:,2}))) == 1000

    for i = 1:1000

        % default foldernames
        filename_before = strcat(trainingset_folder, '\', string(foldernames_and_labels{i,1}));

        % ideal foldernames
        filename_after = strcat(trainingset_folder, '\', string(c_table{i,2}));

        % Rename the folder
        movefile(filename_before, filename_after)

    end
end



