% https://arxiv.org/abs/1609.03082
% sec. 2
% print -painters -dpdf -r300 -bestfit contrastSeparation.pdf
clr;

load ('PHL_radius');      % promienie Ziemi
load ('PSemMajorAxisAU'); % parseki
% load ('PHL_name');
load ('PHL_star_distance'); % parseki
load ('PHL_ESI');

alpha = deg2rad(90);
g_alpha = ( sin(alpha) + (pi - alpha)*cos(alpha) )  / pi;
Ag = 0.22; % dla Ziemi
Rp = 6371*1000; % dla Ziemi
a = 149.60 * 10^6 * 1000; % semi major axis dla Ziemi
inBracket = (Rp/a)^2;
Fp = g_alpha * Ag * inBracket;

%%
PRadius = PRadiusEU * Rp;
SemMaj = PSemMajorAxisAU * 1000*149597871;
SDistanceM = SDistancepc * 3.08567758*10^16;

% PRadiusEU
SemMaj(isnan(PRadius)) = [];
SDistanceM(isnan(PRadius)) = [];
PESI(isnan(PRadius)) = [];
PRadius(isnan(PRadius)) = [];

% semi major axis
PRadius(isnan(SemMaj)) = [];
SDistanceM(isnan(SemMaj)) = [];
PESI(isnan(SemMaj)) = [];
SemMaj(isnan(SemMaj)) = [];

% ESI
PRadius(isnan(PESI)) = [];
SDistanceM(isnan(PESI)) = [];
SemMaj(isnan(PESI)) = [];
PESI(isnan(PESI)) = [];

FluxRatio = g_alpha * 0.4 * (PRadius./SemMaj).^2;
angSep = SemMaj./SDistanceM;
angSep = degrees2dms(rad2deg(angSep));
angSep = angSep(:, 3); 

cc = parula(numel(PESI));
PESiindex = PESI * numel(cc);
PESiindex = round (PESiindex);

angSepPCB = 37*10^(-3);
PCBcontrast = 1.4*10^(-7);
PCBcontrast = PCBcontrast*0.88;
angSepPCB = angSepPCB*1.02;
%%
hold all
for k = 1: numel(PESiindex)
    plot (angSep(k), FluxRatio(k), '.', 'MarkerSize', 8, 'color', cc(k, :));
end
plot (angSepPCB, PCBcontrast, 'ro', 'MarkerSize', 8);
plot (angSepPCB, PCBcontrast, 'rx', 'MarkerSize', 8);
xlabel ('Angular separation  [arcsec]', 'FontSize', 16); ylabel ('Planet-to-star  flux ratio', 'FontSize', 16);

VLTdl = 1.22*750*10^(-9)/8.2;
VLTdl = degrees2dms(rad2deg(VLTdl));

% VLT
xHolder = repmat (VLTdl(3), 1, size(FluxRatio,1));
yHolder = linspace(10^(-16), 10^(-2), numel(FluxRatio));
plot (xHolder, yHolder, '--', 'color', [.7 .7 .7]);

xHolder = repmat (2*VLTdl(3), 1, size(FluxRatio,1));
yHolder = linspace(10^(-16), 10^(-2), numel(FluxRatio));
plot (xHolder, yHolder, '--', 'color', [.7 .7 .7]);

xHolder = repmat (3*VLTdl(3), 1, size(FluxRatio,1));
yHolder = linspace(10^(-16), 10^(-2), numel(FluxRatio));
plot (xHolder, yHolder, '--', 'color', [.7 .7 .7]);

xHolderContrast = linspace(10^(-6), 10^2, numel(angSep));
yHolderContrast = repmat(10^(-7), 1, size(angSep, 1));
plot (xHolderContrast, yHolderContrast, '--', 'color', [.7 .7 .7]);

% E-ELT PCS
xHolderContrast = linspace(10^(-6), 10^2, numel(angSep));
yHolderContrast = repmat(10^(-8), 1, size(angSep, 1));
plot (xHolderContrast, yHolderContrast, '--', 'color', [.5 .3 .3]);

xHolder = repmat (0.015, 1, size(FluxRatio,1));
yHolder = linspace(10^(-16), 10^(-2), numel(FluxRatio));
plot (xHolder, yHolder, '--', 'color', [.5 .3 .3]);


ylim ([10^(-16) 10^(-2)]);
xlim ([10^(-6) 10^(2)]);

text(1, 2*10^(-7), '10e-7     ( VLT )', 'Color', [.5 .5 .5], 'FontSize', 10);
text(1, 2*10^(-8), '10e-8     ( E-ELT PCS )', 'Color', [.5 .3 .3], 'FontSize', 10);

text(1.9*10^(-2), 0.5*10^(-15), 'DL of VLT 8.2m mirror at 750 nm', 'Color', [.5 .5 .5], 'FontSize', 10, 'Rotation', 90);
text(2*1.8*10^(-2), 0.5*10^(-15), '2 \lambda / D', 'Color', [.5 .5 .5], 'FontSize', 10, 'Rotation', 90);
text(4.5*1.8*10^(-2), 0.5*10^(-15), '3 \lambda / D', 'Color', [.5 .5 .5], 'FontSize', 9, 'Rotation', 90);
text(1.1*10^(-2), 0.5*10^(-15), '15 mas, requirement for E-ELT PCS', 'Color', [.5 .3 .3], 'FontSize', 10, 'Rotation', 90);

% Uranus
plot (1.2, 1.1*10^(-11), 'o', 'Color', [0.6 0.6 0.6]', 'MarkerFaceColor', [0.6 0.6 0.6]);
text(1.5, 1.5*10^(-11), 'Uranus', 'Color', [0.6 0.6 0.6], 'FontSize', 12);

% Saturn
plot (0.88, 1.2*10^(-10), 'o', 'Color', [0.6 0.6 0.6]', 'MarkerFaceColor', [0.6 0.6 0.6]);
text(1.05, 1.7*10^(-10), 'Saturn', 'Color', [0.6 0.6 0.6], 'FontSize', 12);

% Jupiter
plot (0.5, 1.07*10^(-9), 'o', 'Color', [0.6 0.6 0.6]', 'MarkerFaceColor', [0.6 0.6 0.6]);
text(0.65, 1.25*10^(-9), 'Jupiter', 'Color', [0.6 0.6 0.6], 'FontSize', 12);

% Mars
plot (0.17, 10^(-11), 'o', 'Color', [0.6 0.6 0.6]', 'MarkerFaceColor', [0.6 0.6 0.6]);
text(0.035, 1.25*10^(-11), 'Mars', 'Color', [0.6 0.6 0.6], 'FontSize', 12);

% Earth
plot (0.09, 1.3*10^(-10), 'o', 'Color', [0.6 0.6 0.6]', 'MarkerFaceColor', [0.6 0.6 0.6]);
text(0.018, 1.9*10^(-10), 'Earth', 'Color', [0.6 0.6 0.6], 'FontSize', 12);

% Venus
plot (0.07, 0.97*10^(-9), 'o', 'Color', [0.6 0.6 0.6]', 'MarkerFaceColor', [0.6 0.6 0.6]);
text(0.011, 0.8*10^(-9), 'Venus', 'Color', [0.6 0.6 0.6], 'FontSize', 12);


set(gca, 'xscale', 'log');
set(gca, 'yscale', 'log');
h = colorbar;
h.Box = 'off';
ylabel(h, 'PESI', 'FontSize', 12)
hold off
% grid on
% ax = gca;
% ax.GridColor = [0.9, 0.9, 0.9];  % [R, G, B]
% annotation('textbox', [0.7 0.53 0.1 0.15], 'String', {'contrast   =   10e-7'}, 'FitBoxToText', 'on', 'LineStyle', 'none', 'Color', [.5 .5 .5], 'FontSize', 10);



