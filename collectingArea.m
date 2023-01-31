% https://en.wikipedia.org/wiki/List_of_largest_optical_telescopes_historically#By_overall_aperture
% https://www.followthesheep.com/?p=1322
% print -painters -dpdf -r300 collectingAreas.pdf
clr;

years = [1609, 1612, 1620, 1638, 1645, 1686, 1686, 1734, 1750, 1761, 1780, 1789, 1845, 1917, 1948, 1976, 1993, 1998, 2009, 2027, 2027];
diameters = [1.5, 2.6, 3.8, 6, 12, 19, 22, 38, 50, 60, 75, 126, 183, 254, 508, 600, 1000, 840, 1040, 3000, 3930];
names = {'Galileo, 1609', 'Galileo, 1612', 'Galileo, 1620', 'Hevelius, Scheiner helioscope', 'Hevelius, refractor', 'Huygens, 19 cm refractor', ...
    'Huygens, 22 cm refractor', 'James Short, Gregorian reflector', 'James Short, Gregorian reflector', 'Father Noel, Gregorian reflector', ...
    'John Michell, Gregorian reflector', 'Herschel', 'Leviathan of Parsonstown', 'Hooker', 'Hale', 'BTA-6', 'Keck 1', 'VLT-1', 'GTC', 'TMT', 'E-ELT'};

diametersM = diameters/100;
areas = pi.*diametersM.^2;

%%
figure('units', 'normalized', 'outerposition', [0 0 1 1], 'numbertitle', 'off', 'name', 'Telescopes')

semilogy (years, areas, 'd', 'MarkerSize', 5); xlabel ('Year', 'FontSize', 16); ylabel ('Collecting area  [m^2]', 'FontSize', 16);
     hold on
     P = polyfit(years, log(areas), 1);
     fit = exp(polyval(P, years));
     plot(years, fit, '--')
     grid on
     ax = gca;
     ax.GridColor = [0.8, 0.8, 0.8];  % [R, G, B]

     xlim ([1590, 2075])
     ylim ([0.7*areas(1) 2*108*68]);
     plot (1590:10:2075, repmat(108*68,      numel(1590:10:2075)), '--', 'Color', [.7 .7 .7]);
     plot (1590:10:2075, repmat(36.57*18.27, numel(1590:10:2075)), '--', 'Color', [.7 .7 .7]);
     plot (1590:10:2075, repmat(pi*(2.54*29/100)^2, numel(1590:10:2075)), '--', 'Color', [.7 .7 .7]);
     plot (1590:10:2075, repmat(pi*(pi*(2.54*13/100)^2)^2, numel(1590:10:2075)), '--', 'Color', [.7 .7 .7]);
     %                 X   Y    
annotation('textbox', [0.15 0.9   0.14 0.017], 'String', 'Football field', 'FitBoxToText', 'on', 'LineStyle', 'none', 'Color', [.3 .3 .3], 'FontSize', 10);
annotation('textbox', [0.15 0.788 0.14 0.017], 'String', 'Tenis field',    'FitBoxToText', 'on', 'LineStyle', 'none', 'Color', [.3 .3 .3], 'FontSize', 10);
annotation('textbox', [0.15 0.507 0.14 0.017], 'String', 'Bicycle  29''  wheel',    'FitBoxToText', 'on', 'LineStyle', 'none', 'Color', [.3 .3 .3], 'FontSize', 10);
annotation('textbox', [0.15 0.435 0.14 0.017], 'String', 'Car  13''  wheel trim',    'FitBoxToText', 'on', 'LineStyle', 'none', 'Color', [.3 .3 .3], 'FontSize', 10);

for ii = [1, 2, 3, 4, 5, 7, 8, 11, 12, 13, 14, 15, 16, 18, 19, 20, 21]
    text( years(ii)+5, areas(ii), names{ii}, 'FontSize', 8, 'Color', [.2 .2 .2], 'FontSize', 11 );
end

h = legend ('Telesopes', 'Semilog fit', 'Location', 'SouthEast');
set (h, 'FontSize', 11);
set (h, 'EdgeColor', [0.9 0.9 0.9]);
