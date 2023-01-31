clr;

% wszyskto @550 nm
load ('PHL_star_distance'); % parseki
load ('PHL_name');

distanceLY = SDistancepc*3.26163344;
LY = 9.4605284*10^12; % km
AU = 149597871; % km
distKM = distanceLY*LY;

arcsecHST = 0.1;
degHST = arcsecHST/3600;
HSTresRad = deg2rad(degHST);

kmAtDistance = distKM*HSTresRad;
auAtDistance = kmAtDistance/AU;

ATLASTfactor = 9.2/2.45; % 9.2m ATLAST version

[~, posMin] = min(kmAtDistance);
nameMin = PName(posMin);
[~, posMax] = max(kmAtDistance);
nameMax = PName(posMax);

loglog (distanceLY, kmAtDistance, '.'); xlabel ('Distance   [LY]', 'FontSize', 14); ylabel ('km  in  1  HST  pix.', 'FontSize', 14);
    hold on
    loglog (distanceLY(posMin), kmAtDistance(posMin), 'ro');
    hold on
    loglog (distanceLY(posMax), kmAtDistance(posMax), 'go');
    hold off
    legend ('All known exoplanets', nameMin{1}, [nameMax{1} ',  dist.:   22k LY'], 'Location','northwest'); legend boxoff
    
    yyaxis right
    plt = gca;
    ylim ([0.129/ATLASTfactor 850/ATLASTfactor]);
    ylabel('AU  in  1  ATLAST  pix.', 'FontSize', 14);
    plt.YAxis(2).Scale = 'log';
    plt.YAxis(2).Color = [0.3 0.3 0.3] ; % change color of RHS y-axis


