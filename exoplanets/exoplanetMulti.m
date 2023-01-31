clr;

% load Encyclopedia data
load ('star_distance');
load ('radius');
load ('name');

%%

name(isnan(star_distance)) = [];
radius(isnan(star_distance)) = [];   % bez dystnsów
star_distance(isnan(star_distance)) = [];

name(isnan(radius)) = [];
star_distance(isnan(radius)) = []; % bez promieni
radius(isnan(radius)) = [];

jupiterRadius = 69911;
earthRadius   = 6371;
planetRadiusKM = jupiterRadius * radius;
distanceLY = star_distance*3.26163344;
LY = 9.4605284*10^12;
distanceKM = distanceLY * LY;
angSize = 2*planetRadiusKM ./ distanceKM; % [rad]
angSizeDeg = degrees2dms(rad2deg(angSize));
angSizeDeg = angSizeDeg(:, 3);
musecs = (10^6)*angSizeDeg;

% Prox C B
distanceProxima = 4.321;
musecProximaB = 71.0441;

% habitable
minRdiusHabitable = 0.5*earthRadius;
maxRdiusHabitable = 1.5*earthRadius;
earthLikePlanetRadiusKM = planetRadiusKM;
earthLikeDistanceKM = distanceKM;
earthLikeDistanceLY = distanceLY;

earthLikePlanetRadiusKM(earthLikePlanetRadiusKM<minRdiusHabitable) = nan; % nieziemski promieñ
earthLikePlanetRadiusKM(earthLikePlanetRadiusKM>maxRdiusHabitable) = nan;
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
countEL = numel(ELmusecs);
countJupiters = numel(musecs) - countEL;

edges = -3:0.1:6;

figure( 'name', 'Exoplanets', 'numbertitle', 'off', 'units', 'normalized', 'outerposition', [0 0 1 1] );
subplot 131, loglog (distanceLY, musecs, '.'); ylabel('angular size  [\muarcsec]','FontSize',19); xlabel ('distance  [LY]','FontSize',19);
    hold on;
    loglog ( distanceProxima, musecProximaB, 'rx' );
    hold on;
    loglog (earthLikeDistanceLY, ELmusecs, '.');
    hold off
    legend ('Neptune - like  or other', 'Proxima Centauri B', 'terran radius'); legend boxoff
subplot 132, histogram (log(musecs), edges); xlabel('angular size  [\muarcsec]','FontSize',19); ylabel ('Count','FontSize',19);
    hold on;
    histogram (log(ELmusecs), edges);
    hold off
    set(gca,'XTickLabel',{'0.05'; '0.13'; '0.36'; '1'; '2.72'; '7.39'; '20'; '55'; '150'; '400'});
    legend ([' all;                   count: '  num2str(countJupiters)], [' terran radius;  count: ' num2str(countEL)]); legend boxoff


dim = [0.53 0.35 0.4 0.4]; % [x y w h]
str(1) = {'10  largest angulary:'};
str(2) = {'(w/o Prox. Cent. B)'};
str(3) = {''};
str(4:13) = name_sorted(1:10);
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
proxDiamRad = 1.1*2*earthRadius/distanceProximaKM;
Dprox = 1.22*lambda/proxDiamRad;

subplot 133, 
loglog (distanceLY, hstCompMuSec, '.'); xlabel ('distance  [LY]','FontSize',19); ylabel('\times  smaller than HST limit','FontSize',19);
    hold on;
    loglog ( distanceProxima, hstCompMuSecProx, 'rx' );
    hold on;
    loglog (earthLikeDistanceLY, hstCompMuSecEL, '.');
    hold off
    legend ('Neptune - like  or other', 'Proxima Centauri B', 'terran radius','Location','southeast'); legend boxoff
    
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
    



    
    