clr;

% load PHL data
% http://phl.upr.edu/projects/habitable-exoplanets-catalog/data/database
load ('PHL_radius'); % promienie Ziemi
load ('PHL_star_distance'); % parseki
load ('PHL_name');
load ('PHL_ESI');
star_distance = SDistancepc;
name = PName;
radius = PRadiusEU;

name(isnan(star_distance)) = [];   % bez dystnsów
PESI(isnan(star_distance)) = [];
radius(isnan(star_distance)) = [];
star_distance(isnan(star_distance)) = [];

name(isnan(radius)) = []; % bez promieni
PESI(isnan(radius)) = [];
star_distance(isnan(radius)) = [];
radius(isnan(radius)) = [];

radius(isnan(PESI)) = []; % bez PESI
star_distance(isnan(PESI)) = [];
PESI(isnan(PESI)) = [];

jupiterRadius = 69911;
earthRadius   = 6371;
planetRadiusKM = earthRadius * radius; % dla PHL
distanceLY = star_distance*3.26163344;
LY = 9.4605284*10^12;
distanceKM = distanceLY * LY;
angSize = 2*planetRadiusKM ./ distanceKM; % [rad]
angSizeDeg = degrees2dms(rad2deg(angSize));
angSizeDeg = angSizeDeg(:, 3);
musecs = (10^6)*angSizeDeg;

% Prox C B
distanceProxima = 4.207;
musecProximaB = 71.0441;

% habitable
earthLikePlanetRadiusKM = planetRadiusKM;
earthLikeDistanceKM = distanceKM;
earthLikeDistanceLY = distanceLY;

earthLikePlanetRadiusKM(PESI<0.60) = nan; % nieziemski promieñ
earthLikeDistanceKM(isnan(earthLikePlanetRadiusKM)) = [];
earthLikeDistanceLY(isnan(earthLikePlanetRadiusKM)) = [];

earthLikePlanetRadiusKM(isnan(earthLikePlanetRadiusKM)) = [];
angSizeEL = 2*earthLikePlanetRadiusKM ./ earthLikeDistanceKM;
angSizeELdeg = degrees2dms(rad2deg(angSizeEL));
angSizeELdeg = angSizeELdeg(:, 3);
ELmusecs = (10^6)*angSizeELdeg;

[musecsSorted, ind] = sort(musecs, 'descend');
name_sorted = name(ind);

%%
edges = -4:0.1:6;
figure( 'name', 'Exoplanets', 'numbertitle', 'off', 'units', 'normalized', 'outerposition', [0 0 1 1] );
subplot 131, loglog (distanceLY, musecs, '.'); ylabel('angular size  [\muarcsec]','FontSize',19); xlabel ('distance  [LY]','FontSize',19);
    hold on;
    loglog ( distanceProxima, musecProximaB, 'ro' , 'markersize', 8);
    hold on;
    loglog (earthLikeDistanceLY, ELmusecs, '.', 'markersize', 12);
    hold off
    legend ('Neptune - like  or other', 'Proxima Centauri B', 'ESI  >  0.60'); legend boxoff
subplot 132, histogram (log(musecs), edges); xlabel('angular size  [\muarcsec]','FontSize',19); ylabel ('Count','FontSize',19);
    hold on;
    histogram (log(ELmusecs), edges);
    hold off
    set(gca,'XTickLabel',{'0.02'; '0.13'; '1'; '7.39'; '55'; '403'});
    legend ({['  Neptune-like or other;  count:    '  num2str(numel(name))] ['  ESI  >  0.60;                 count:    '  num2str(numel(ELmusecs))]}); legend boxoff

dim = [0.52 0.44 0.4 0.4]; % [x y w h]
str(1) = {'10  largest angulary:'};
str(2) = {''};
str(3:12) = name_sorted(1:10);
annotation('textbox', dim, 'String', str, 'EdgeColor','none');

lambda = 550*10^(-9);
Dhst = 2.45;
theta = 1.22*lambda/Dhst;
theta = rad2deg(theta);
theta = degrees2dms(theta);
resSec = theta(3);
hstCompMuSec     = resSec./angSizeDeg;
hstCompMuSecEL   = resSec./angSizeELdeg;
hstCompMuSecProx = resSec /musecProximaB*10^6;
D   = 1.22*lambda./angSize;
Del = 1.22*lambda./angSizeEL;

distanceProximaKM = distanceProxima*LY;
proxDiamRad = 1.12*2*earthRadius/distanceProximaKM;
Dprox = 1.22*lambda/proxDiamRad;

% figure( 'name', 'Exoplanets 2', 'numbertitle', 'off', 'units', 'normalized', 'outerposition', [0 0 1 1] );
subplot 133, 
loglog (distanceLY, hstCompMuSec, '.'); xlabel ('distance  [LY]','FontSize',19); ylabel('\times  smaller than HST limit','FontSize',19);
    hold on;
    loglog ( distanceProxima, hstCompMuSecProx, 'ro' , 'markersize', 8);
    hold on;
    loglog (earthLikeDistanceLY, hstCompMuSecEL, '.', 'markersize', 12);
    hold off
    legend ('Neptune - like  or other', 'Proxima Centauri B', 'ESI  >  0.60','Location','northwest'); legend boxoff
    
    yyaxis right
    plt = gca;
    ylim ([10^3 10^8]);
    ylabel('D   for  5\times5  pix. image  [m]','FontSize',19);
    plt.YAxis(2).Scale = 'log';
    plt.YAxis(2).Color = [0.5 0.5 0.5] ; % change color of RHS y-axis
    
% UWA¯AÆ, ¯EBY SKALE SIÊ NIE ROZJECHA£Y  !!
% figure
% loglog ((distanceLY), (5*D), '.'); xlabel ('distance  [LY]','FontSize',19); ylabel('telescope diameter for 5 pix. image','FontSize',19);
%     hold on;
%     loglog ( (distanceProxima), (5*Dprox), 'rx' );
%     hold on;
%     loglog ((earthLikeDistanceLY), (5*Del), '.');
%     hold off
%     legend ('Neptune - like  or other', 'Proxima Centauri B', 'Earth - like  radius','Location','southeast'); legend boxoff
    

% %%
% IndexC = strfind(name_sorted, 'Proxima b');
% Index = find(not(cellfun('isempty', IndexC)))

%% PdD
% print -painters -dpdf -r300 -bestfit fig4exopl.pdf
% clc
figure
% subplot 132, 
histogram (log(musecs), edges); xlabel('angular size  [\muarcsec]','FontSize', 16); ylabel ('Count','FontSize',16);
hold on;
histogram (log(ELmusecs), edges);
hold off
set(gca,'XTickLabel',{'0.02'; '0.13'; '1'; '7.39'; '55'; '403'});
legend ({['  Neptune-like or other;  count:    '  num2str(numel(name))] ['  ESI  >  0.60;                 count:    '  num2str(numel(ELmusecs))]}); legend boxoff

dim = [0.52 0.44 0.4 0.4]; % [x y w h]
str(1) = {'10  largest angularily:'};
str(2) = {''};
str(3:12) = name_sorted(1:10);
annotation('textbox', dim, 'String', str, 'EdgeColor','none');
