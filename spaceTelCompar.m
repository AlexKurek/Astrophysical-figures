% https://jwst.stsci.edu/science-planning/proposal-planning-toolbox/sensitivity-overview
% print -painters -dpdf -r300 -bestfit spaceTelCompar.pdf
clr

figure('units', 'normalized', 'outerposition', [0 0 1 1])
xlim ([0.25 2*10^7])
ylim ([10^(-10) 2*10^(1)])
hold all

% JWST
JWSTlambda = [0.70, 0.90, 1.15, 1.50, 2.00, 2.77, 3.56, 4.44, 5.6, 7.7, 10, 10, 12.8, 15, 18, 21, 21, 25.5];
JWST = [20.9E-9, 14.3E-9, 11.8E-9, 11.2E-9, 11.4E-9, 12.3E-9, 13.8E-9, 24.5E-9, 0.2E-6, 0.28E-6, 0.7E-6, 700.0E-9, 1.4E-6, 2.1E-6, 4.3E-6, 8.6E-6, 8.7E-6, 29E-6];
plot (JWSTlambda(1:8), JWST(1:8), '-o', 'Color', [1 1 1])

% Spitzer
SpitzerLambda = [3.5, 4.5, 5.8, 8, 24, 70, 160];
spitzer = [0.6E-6, 1.2E-6, 8E-6, 9.8E-6, 112E-6, 6E-3, 80E-3];
plot (SpitzerLambda, spitzer, '-d')
text(3.5*10, 3*10^(-4), 'Spitzer', 'Color', [0.85 .325 .098], 'FontSize', 12)

% HST
HSTlambda = [0.606, 0.814, 0.814, 1.1, 1.6, 1.75];
HST = [1.5E-8, 3.2E-8, 2.5E-8, 2.6E-8, 5.0E-8, 6.5E-7];
plot (HSTlambda, HST, '-d')
text(1.8, 10^(-7), 'HST', 'Color', [0.929 .694 .125], 'FontSize', 12)

% Wise
wiseLambda = [3.35, 4.60, 11.56, 22.09];
wise = [0.16E-3, 0.22E-3, 2E-3, 12E-3];
plot (wiseLambda, wise, '-d')
text(10, 10^(-3), 'WISE', 'Color', [0.494 .184 .556], 'FontSize', 12)

% Sofia
sofiaLambda = [1.2, 1.7, 2.2, 2.4, 3.2, 3.8, 4.7, 6.5, 20, 25];
sofia = [6E-06, 7.5E-06, 6.75E-06, 3.75E-06, 1.35E-05, 7.5E-5, 3.75E-4, 0.06, 0.038, 0.071];
plot (sofiaLambda, sofia, '-d')
text(1.2, 2*10^(-5), 'SOFIA', 'Color', [0.466 .674 .188], 'FontSize', 12)

% Gemini NIRI
geminiLambda = [0.475, 0.63, 0.78, 0.95, 1.01, 1.25, 1.65, 2.2, 3.76, 4.68];
gemini = [1.07E-7, 1.6E-7, 2.3E-7, 5.3E-7, 2E-6, 1.1E-6, 1.7E-6 9E-7 5.6E-5 4.4E-4];
plot (geminiLambda, gemini, '-d')
text(0.34, 10^(-6), 'Gemini', 'Color', [0.301 .745 .933], 'FontSize', 12)

% Herschel
cherschelLambda = [70, 100, 160, 250, 350, 500];
cherschel = [6E-3,  6E-3,  12E-3, 6E-3, 8.3E-2, 10.3E-2];
plot (cherschelLambda, cherschel, '-d')
text(100, 3*10^(-3), 'Herschel', 'Color', [0.635 .078 .184], 'FontSize', 12)

% ALMA finished
% https://www.eso.org/public/news/eso1342/
almaZeroLambda = [4.0E3, 1.7E3, 1.16E3, 590];
almaZero = [0.17E-3, 0.24E-3, 0.44E-3, 3.84E-3];
plot (almaZeroLambda, almaZero, '-d')
text(5*10^2, 0.4*10^(-4), {'ALMA' 'finished'}, 'Color', [0.85 .325 .098], 'FontSize', 12)

% ALMA Cycle 0
almaFinishLambda = [4E3, 2.85E3, 1.7E3, 1.16E3, 1160, 590, 470];
almaFinish = [5E-5, 8E-5, 8E-5, 1.4E-4, 1.4E-4, 1.3E-3, 3.1E-3];
plot (almaFinishLambda, almaFinish, '-d')
text(10^3, 4*10^(-3), {'ALMA' 'Cycle 0'}, 'Color', [0 .447 .741], 'FontSize', 12)

% LUVOIR_B  8 m
LUVOIR_B_Lambda = [HSTlambda(1), JWSTlambda(1:5)];
LUVOIR_B = [HST(1)./11.1, JWST(1:5)./1.5];
LUVOIR_B = 0.8*LUVOIR_B; % założony lepszy detektor (o 20%)
plot (LUVOIR_B_Lambda, LUVOIR_B, '-o', 'Color', [0.494 0.184 0.556])
text(2.7, 0.7*10^(-8), 'LUVOIR-B   8m', 'FontSize', 12, 'Color', [0.494 0.184 0.556])

% LUVOIR_A  15.1 m
LUVOIR_A_Lambda = [HSTlambda(1), JWSTlambda(1:5)];
LUVOIR_A = [HST(1)./38, JWST(1:5)./5.4];
LUVOIR_A = 0.8*LUVOIR_A; % założony lepszy detektor (o 20%)
plot (LUVOIR_A_Lambda, LUVOIR_A, '-o', 'Color', [0.466 0.674 0.188])
text(2.7, 1.5*10^(-9), 'LUVOIR-A', 'FontSize', 12, 'Color', [0.466 0.674 0.188])

% Euclid
Euclidlambda = [1, 1.26, 1.66];
Euclid = [10^(-6), 10^(-6), 10^(-6)]*4;
EuclidVisLambda = [0.55, 0.76 0.9];
EuclidVis = [2.5*10^(-8), 2.5*10^(-8), 2.5*10^(-8)]*4;
plot (Euclidlambda, Euclid, '-mo')
plot (EuclidVisLambda, EuclidVis, '-mo')
h2aa = plot ([EuclidVisLambda(end) Euclidlambda(1)], [EuclidVis(end) Euclid(1)], '--', 'Color', [1 0 1]); h2aa.Color(4)=0.3;
text(0.36, 4.5*10^(-6), 'Euclid', 'FontSize', 12, 'Color', [1 0 1])

% NGRST (dawniej WFIRST)
NGRSTlambda = [1.02, 1.22, 1.63, 1.84];
NGRST = [5*10^(-8), 4*10^(-8), 5.2*10^(-8), 2*10^(-7)]*4;
plot (NGRSTlambda, NGRST, '-co')
text(1.9, 3.2*10^(-7), 'NGRST', 'FontSize', 12, 'Color', 'c')

% JWST drugi raz
plot (JWSTlambda(1:8), JWST(1:8), '-o', 'Color', [1 0 0])
plot (JWSTlambda(9:end), JWST(9:end), '-o', 'Color', [1 0 0])
h2a = plot (JWSTlambda(8:9), JWST(8:9), '--', 'Color', [1 0 0]); h2a.Color(4)=0.3;
text(1.9*10, 10^(-6), {'JWST' 'MIRI'}, 'Color', [1 0 0], 'FontSize', 12)
text(0.55*10, 3*10^(-8), 'JWST  NIRCam', 'Color', [1 0 0], 'FontSize', 12)


% LOFAR EoR 21 cm
% 2.608695 m - 115 MHz
% 1.666666 m - 180 MHz
% noOfEl = 10;
hh = area([1666666 2608695], [2*10^1 2*10^1], 'LineStyle', 'none');
hh.FaceColor = [0.6 0.2 0.6];
alpha(.15)
text(1.0*10^6, 0.000002, {'LOFAR' ' 21 cm'}, 'Color', [0.6 0.2 0.6], 'FontSize', 10)

% LOFAR LoTSS
% https://www.aanda.org/articles/aa/pdf/forth/aa33559-18.pdf
hh = area([2.0*10^6 2.5*10^6], [2*10^1 2*10^1], 'LineStyle', '--', 'EdgeColor', [0.9 0.2 0.9]);
hh.FaceColor = [0.9 0.2 0.9];
% alpha(.15)
text(2.7*10^6, 0.0000002, {'LOFAR' ' LoTSS'}, 'Color', [0.6 0.2 0.6], 'FontSize', 10)

% LOFAR EOR
% 1.47 m (z=6)
% 4.41 m (z=20)
hh = area([1.47*10^6 4.41*10^6], [2*10^1 2*10^1], 'LineStyle', 'none');
hh.FaceColor = [0.9 0.1 0.9];
alpha(.15)
text(4*10^6, 0.000002, {' LOFAR' '   EoR'}, 'Color', [0.9 0.3 0.9], 'FontSize', 12)

% LOFAR
% https://old.astron.nl/radio-observatory/astronomers/lofar-imaging-capabilities-sensitivity/sensitivity-lofar-array/sensiti
LOFARlambdaM = [10, 6.67, 5, 4, 2.5, 2, 1.67, 1.5, 1.43, 1.25];
LOFARlambda = LOFARlambdaM*10^6;
LOFAR8h = [3.8, 3.1, 2.6, 4.5, 0.2, 0.16, 0.2, 0.32, 0.32, 0.76];
LOFAR = LOFAR8h*1.6971;
LOFAR = LOFAR*10^(-3); % do muJy
plot (LOFARlambda(1:end-3), LOFAR(1:end-3), '-md')
plot (LOFARlambda(end-3:end), LOFAR(end-3:end), '-mo')
text(6*10^5, 10^(-2), {' LOFAR' 'full array'}, 'Color', [1 0 1], 'FontSize', 12)


% GN-z11
filters = [0.435, 0.606, 0.775, 0.814, 0.85, 1.05, 1.25, 1.4, 1.6, 2.19, 3.6, 4.5];
flux = [7, 2, 5, 3, 17, -7, 11, 64, 152, 137, 139, 144];
flux = flux * 10^(-9);
% yerr = [9, 7, 10, 7, 11, 9, 8, 13, 10, 67, 21, 27];
% yerr = yerr * 10^(-9);
% errorbar(filters, flux, yerr, yerr, 'vertical', 'Color', [0.7 0.7 0.7]);
plot (filters, flux, 'o', 'Color', [0.6 0.6 0.6]', 'MarkerFaceColor', [0.6 0.6 0.6], 'MarkerSize', 3)
plot (filters, flux, 'x', 'Color', [0.6 0.6 0.6], 'MarkerSize', 7)
% plot (filters, flux, 'kx','MarkerFaceColor','auto');
text(5, 1.2*10^(-7), 'GN-z11', 'Color', [0.6 0.6 0.6], 'FontSize', 10, 'FontWeight', 'bold')


% SGA*
SGAfilters = [0.0135, 0.0069557, 0.0034779]; % m
SGAfilters = SGAfilters .* 10^6; % um
SGAflux = [1.33, 1.79, 3.35];
plot (SGAfilters, SGAflux, 'x', 'Color', [0.6 0.6 0.6]', 'MarkerFaceColor', [0.6 0.6 0.6])
plot (SGAfilters, SGAflux, 'o', 'Color', [0.6 0.6 0.6]')
text(4*10^3, 0.75, 'Saggitarius A*', 'Color', [0.6 0.6 0.6], 'FontSize', 10)


set(gca, 'xscale', 'log')
set(gca, 'yscale', 'log')
hold off

xlabel ('Wavelength  [\mum]', 'FontSize', 16)
ylabel ('Limiting flux in  10^4 s    [Jy]', 'FontSize', 16)

yyaxis right
plt = gca;
ylim ([6.1 33.6])
ylabel('m_{AB}', 'FontSize', 16, 'Color', [0.3 0.3 0.3])
set(gca, 'YDir', 'reverse')
plt.YAxis(2).Color = [0.3 0.3 0.3];
set(plt, 'YTick', 8:2:33)


ax1 = gca; % current axes
ax1_pos = ax1.Position; % position of first axes
ax2 = axes('Position', ax1_pos, 'XAxisLocation', 'top', 'Color', 'none', 'XScale', 'log', 'XDir','Reverse', 'Xlim', [0.02 10^6]);
ax2.YAxis.Visible = 'off';


text(390, 1.06, 'Frequency   [GHz]', 'FontSize', 16)



