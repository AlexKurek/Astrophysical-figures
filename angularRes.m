% https://en.wikipedia.org/wiki/List_of_largest_optical_telescopes_historically#By_overall_aperture
% https://www.followthesheep.com/?p=1322
% http://shirt-ediss.me/matlab-octave-more-colours/

clr
figure('units', 'normalized', 'outerposition', [0 0 1 1])

yearsTel = [1609, 1612, 1620, 1638, 1645, 1686, 1686, 1734, 1750, 1761, 1780, 1789, 1845, 1917, 1948, 1976, 1993, 1998, 2009, 2027];
diameters = [1.5, 2.6, 3.8, 6, 12, 19, 22, 38, 50, 60, 75, 126, 183, 254, 508, 600, 1000, 840, 1040, 3930];
names = {'Galileo, 1609', 'Galileo, 1612', 'Galileo, 1620', 'Hevelius, Scheiner helioscope', 'Hevelius, refractor', 'Huygens, 19 cm refractor', ...
    'Huygens, 22 cm refractor', 'James Short, Gregorian reflector', 'James Short, Gregorian reflector', 'Father Noel, Gregorian reflector', ...
    'John Michell, Gregorian reflector', 'Herschel', 'Leviathan of Parsonstown', 'Hooker', 'Hale', 'BTA-6', 'Keck 1', 'VLT-1', 'GTC', 'E-ELT'};

diametersM = diameters/100;
lambda = 550*10^(-9); % nm
res = 1.22*lambda./diametersM;
resSec = degrees2dms (rad2deg(res'));
resSec = resSec(:, 3);

semilogy (yearsTel, resSec, '-', 'color', [8 180 238] ./ 255)
ylim ([10^(-6) 10^2])
axis ij
hold on
semilogy (yearsTel, resSec, 'd', 'color', [8 180 238] ./ 255)
hold on

yearsSeeing = [1609, 1612, 1620,                1638,       1910, 1910, 1970, 1970, 1997, 1997, 2000, 2000, 2001, 2001];
resSeeing   = [resSec(1), resSec(2), resSec(3), resSec(4),  resSec(4), 1.5,  1.5,  0.4, 0.4, 0.05, 0.05, 0.004, 0.004, 0.0004];

namesRes = {'Naked eye', 'Galileo, 1609', 'Galileo, 1612', 'Galileo, 1620', 'Hevelius, Scheiner helioscope', '', 'Californian observations',  '', ...
    {'' '' 'Hawaiian and ' 'Chilean' 'observations'}, '', 'HST', '', 'KIA', '', 'VLTI'};

yearsSeeing = [1609, yearsSeeing];
resSeeing   = [60, resSeeing];

for ii = [1, 2, 3, 4, 5, 6, 7, 9, 11, 13, 15]
    text( yearsSeeing(ii)+2, resSeeing(ii) + 0.2*resSeeing(ii), namesRes{ii}, 'FontSize', 8, 'Color', [.2 .2 .2], 'FontSize', 11, 'color', [251 111 66] ./ 255 )
end

hold on
semilogy (yearsSeeing, resSeeing, '--', 'color', [251 111 66] ./ 255)
xlabel ('Years', 'FontSize', 16); ylabel ('Angular resolutuion   [arcsec]', 'FontSize', 16)
hold on

grid on
ax = gca;
ax.GridColor = [0.9, 0.9, 0.9];  % [R, G, B]

for ii = [20-2, 20-1]
    text( yearsTel(ii)+2, resSec(ii) + 0.2*resSec(ii), names{ii}, 'FontSize', 8, 'Color', [.2 .2 .2], 'FontSize', 11, 'color', [8 180 238] ./ 255 )
end
text( yearsTel(20)-10, resSec(20) - 0.35*resSec(20), names{20}, 'FontSize', 8, 'Color', [.2 .2 .2], 'FontSize', 11, 'color', [8 180 238] ./ 255 )

text( 1917+2, resSec(14) + 0.2*resSec(14), {'' '100 in.' 'Mount Willson'}, 'FontSize', 8, 'Color', [.2 .2 .2], 'FontSize', 11, 'color', [8 180 238] ./ 255 )

% EHT  ("The longest baselines have an interferometric fringe spacing of 1/∣ u ∣ ≈ 24 μas, which defines the diffraction-limited angular resolution of the EHT",  https://iopscience.iop.org/article/10.3847/2041-8213/ac6674#apjlac6674s3 )
hold on
semilogy (2017, 25*10^(-6), 'rx')
hold on
semilogy (2017, 25*10^(-6), 'ro')
hold on
text( 2009-20, 25*10^(-6), {' EHT (radio)'}, 'FontSize', 8, 'Color', [.2 .2 .2], 'FontSize', 11, 'color', 'r' )
hold on

% ngEHT
% https://youtu.be/CUpiYCLRq-U?t=1998
% 3-10x lepiej niż EHT, czyli (3+10)/2 = 6.5x
semilogy (2030, (1/6.5)*25*10^(-6), 'rx')
hold on
semilogy (2030, (1/6.5)*25*10^(-6), 'ro')
hold on
text( 2030-20,  (1/6.5)*25*10^(-6), {' ngEHT'}, 'FontSize', 8, 'Color', [.2 .2 .2], 'FontSize', 11, 'color', 'r' )
hold on

% semilogy (2014, 20*10^(-2), 'rx')
% hold on
% semilogy (2014, 20*10^(-2), 'ro')
% hold on
% text( 2014+5, 20*10^(-2) + 0.2*20*10^(-2), {'  LOFAR' '(240 MHz)'}, 'FontSize', 8, 'Color', [.2 .2 .2], 'FontSize', 11, 'color', 'r' )
% hold on

plot (1600:10:2050, repmat(0.123,      numel(1600:10:2050)), '--', 'Color', [.7 .7 .7])
plot (1600:10:2050, repmat(0.001,      numel(1600:10:2050)), '--', 'Color', [.7 .7 .7])
plot (1600:10:2050, repmat(71*10^(-6), numel(1600:10:2050)), '--', 'Color', [.7 .7 .7])
annotation('textbox', [0.15 0.42   0.14 0.017],  'String', 'Pluto',              'FitBoxToText', 'on', 'LineStyle', 'none', 'Color', [.5 .5 .5], 'FontSize', 10)
annotation('textbox', [0.15 0.635   0.14 0.017], 'String', 'Proxima Centauri',   'FitBoxToText', 'on', 'LineStyle', 'none', 'Color', [.5 .5 .5], 'FontSize', 10)
annotation('textbox', [0.15 0.755   0.14 0.017], 'String', 'Proxima Centauri B', 'FitBoxToText', 'on', 'LineStyle', 'none', 'Color', [.5 .5 .5], 'FontSize', 10)
hold off

yyaxis right
plt = gca;
ylim ([0.0014 1.2e+05])
ylabel('Diameter / baseline   ( only for optical instruments )     [m]', 'FontSize', 16, 'Color', [0.3 0.3 0.3])
plt.YAxis(2).Scale = 'log';
plt.YAxis(2).Color = [0.3 0.3 0.3];

