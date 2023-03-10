clr;

%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\Alex\Documents\MATLAB\exoplanet.eu_catalog.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2016/09/16 17:58:21

%% Initialize variables.
% COS JEST NIE TAK OD KONCA 2017 z PROMIENIAMI, PELNO NAN-OW
filename = 'C:\Users\Alex\Documents\MATLAB\exoplanets\exoplanet.eu_catalog.csv';
% filename = 'C:\Users\Alex\Documents\MATLAB\exoplanets\exoplanet.eu_catalogNEW.csv';
delimiter = ',';
startRow = 2;

%% Read columns of data as strings:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric strings to numbers.
% Replace non-numeric strings with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,26,27,28,29,30,31,50,51,52,54,59,65,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,87,88,89,90,91,92]
    % Converts strings in the input cell array to numbers. Replaced non-numeric
    % strings with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1)
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData{row}, regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if any(numbers==',')
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'))
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric strings to numbers.
            if ~invalidThousandsSeparator
                numbers = textscan(strrep(numbers, ',', ''), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch me
        end
    end
end


%% Split data into numeric and cell columns.
rawNumericColumns = raw(:, [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,26,27,28,29,30,31,50,51,52,54,59,65,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,87,88,89,90,91,92]);
rawCellColumns = raw(:, [1,25,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,53,55,56,57,58,60,61,62,63,64,66,86,93,94,95]);


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Allocate imported array to column variable names
name = rawCellColumns(:, 1);
mass = cell2mat(rawNumericColumns(:, 1));
mass_error_min = cell2mat(rawNumericColumns(:, 2));
mass_error_max = cell2mat(rawNumericColumns(:, 3));
mass_sini = cell2mat(rawNumericColumns(:, 4));
mass_sini_error_min = cell2mat(rawNumericColumns(:, 5));
mass_sini_error_max = cell2mat(rawNumericColumns(:, 6));
radius = cell2mat(rawNumericColumns(:, 7));
radius_error_min = cell2mat(rawNumericColumns(:, 8));
radius_error_max = cell2mat(rawNumericColumns(:, 9));
orbital_period = cell2mat(rawNumericColumns(:, 10));
orbital_period_error_min = cell2mat(rawNumericColumns(:, 11));
orbital_period_error_max = cell2mat(rawNumericColumns(:, 12));
semi_major_axis = cell2mat(rawNumericColumns(:, 13));
semi_major_axis_error_min = cell2mat(rawNumericColumns(:, 14));
semi_major_axis_error_max = cell2mat(rawNumericColumns(:, 15));
eccentricity = cell2mat(rawNumericColumns(:, 16));
eccentricity_error_min = cell2mat(rawNumericColumns(:, 17));
eccentricity_error_max = cell2mat(rawNumericColumns(:, 18));
inclination = cell2mat(rawNumericColumns(:, 19));
inclination_error_min = cell2mat(rawNumericColumns(:, 20));
inclination_error_max = cell2mat(rawNumericColumns(:, 21));
angular_distance = cell2mat(rawNumericColumns(:, 22));
discovered = cell2mat(rawNumericColumns(:, 23));
updated = rawCellColumns(:, 2);
omega = cell2mat(rawNumericColumns(:, 24));
omega_error_min = cell2mat(rawNumericColumns(:, 25));
omega_error_max = cell2mat(rawNumericColumns(:, 26));
tperi = cell2mat(rawNumericColumns(:, 27));
tperi_error_min = cell2mat(rawNumericColumns(:, 28));
tperi_error_max = cell2mat(rawNumericColumns(:, 29));
tconj = rawCellColumns(:, 3);
tconj_error_min = rawCellColumns(:, 4);
tconj_error_max = rawCellColumns(:, 5);
tzero_tr = rawCellColumns(:, 6);
tzero_tr_error_min = rawCellColumns(:, 7);
tzero_tr_error_max = rawCellColumns(:, 8);
tzero_tr_sec = rawCellColumns(:, 9);
tzero_tr_sec_error_min = rawCellColumns(:, 10);
tzero_tr_sec_error_max = rawCellColumns(:, 11);
lambda_angle = rawCellColumns(:, 12);
lambda_angle_error_min = rawCellColumns(:, 13);
lambda_angle_error_max = rawCellColumns(:, 14);
impact_parameter = rawCellColumns(:, 15);
impact_parameter_error_min = rawCellColumns(:, 16);
impact_parameter_error_max = rawCellColumns(:, 17);
tzero_vr = rawCellColumns(:, 18);
tzero_vr_error_min = rawCellColumns(:, 19);
tzero_vr_error_max = rawCellColumns(:, 20);
k = cell2mat(rawNumericColumns(:, 30));
k_error_min = cell2mat(rawNumericColumns(:, 31));
k_error_max = cell2mat(rawNumericColumns(:, 32));
temp_calculated = rawCellColumns(:, 21);
temp_measured = cell2mat(rawNumericColumns(:, 33));
hot_point_lon = rawCellColumns(:, 22);
geometric_albedo = rawCellColumns(:, 23);
geometric_albedo_error_min = rawCellColumns(:, 24);
geometric_albedo_error_max = rawCellColumns(:, 25);
log_g = cell2mat(rawNumericColumns(:, 34));
publication_status = rawCellColumns(:, 26);
detection_type = rawCellColumns(:, 27);
mass_detection_type = rawCellColumns(:, 28);
radius_detection_type = rawCellColumns(:, 29);
alternate_names = rawCellColumns(:, 30);
molecules = cell2mat(rawNumericColumns(:, 35));
star_name = rawCellColumns(:, 31);
ra = cell2mat(rawNumericColumns(:, 36));
dec = cell2mat(rawNumericColumns(:, 37));
mag_v = cell2mat(rawNumericColumns(:, 38));
mag_i = cell2mat(rawNumericColumns(:, 39));
mag_j = cell2mat(rawNumericColumns(:, 40));
mag_h = cell2mat(rawNumericColumns(:, 41));
mag_k = cell2mat(rawNumericColumns(:, 42));
star_distance = cell2mat(rawNumericColumns(:, 43));
star_distance_error_min = cell2mat(rawNumericColumns(:, 44));
star_distance_error_max = cell2mat(rawNumericColumns(:, 45));
star_metallicity = cell2mat(rawNumericColumns(:, 46));
star_metallicity_error_min = cell2mat(rawNumericColumns(:, 47));
star_metallicity_error_max = cell2mat(rawNumericColumns(:, 48));
star_mass = cell2mat(rawNumericColumns(:, 49));
star_mass_error_min = cell2mat(rawNumericColumns(:, 50));
star_mass_error_max = cell2mat(rawNumericColumns(:, 51));
star_radius = cell2mat(rawNumericColumns(:, 52));
star_radius_error_min = cell2mat(rawNumericColumns(:, 53));
star_radius_error_max = cell2mat(rawNumericColumns(:, 54));
star_sp_type = rawCellColumns(:, 32);
star_age = cell2mat(rawNumericColumns(:, 55));
star_age_error_min = cell2mat(rawNumericColumns(:, 56));
star_age_error_max = cell2mat(rawNumericColumns(:, 57));
star_teff = cell2mat(rawNumericColumns(:, 58));
star_teff_error_min = cell2mat(rawNumericColumns(:, 59));
star_teff_error_max = cell2mat(rawNumericColumns(:, 60));
star_detected_disc = rawCellColumns(:, 33);
star_magnetic_field = rawCellColumns(:, 34);
star_alternate_names = rawCellColumns(:, 35);


%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans raw col numericData rawData row regexstr result numbers invalidThousandsSeparator thousandsRegExp me rawNumericColumns rawCellColumns R;

%%
save ('radius', 'radius');
save ('star_distance', 'star_distance');
save ('name', 'name');




