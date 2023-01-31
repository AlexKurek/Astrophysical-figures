clr;

noOfEl = 100;
lambda = 550*10^(-12); % km
size = 10; % km
D = logspace (-2, 5.5, noOfEl); % km

LY = 9.4605284 * 10^12; % km
AU = 149597871; % km
dist = size*D ./ (1.22*lambda); % km
distAU = dist / AU; % AU
distLY = dist / LY;

loglog (D, distAU*200);
hold on
loglog (D, distAU*20);
hold on
loglog (D, distAU);
hold on

distanceProxima = 4.321;
distanceProximaKM = distanceProxima*LY;
distanceProximaAU = distanceProximaKM/AU;
plot (D, repmat(distanceProximaAU, noOfEl, 1), '--');
hold on
plot (D, repmat(137, noOfEl, 1), '--', 'Color', [0.49 .18 .56]);
text(2*10, 4*10^2, 'Voyager 1', 'Color', [0.49 .18 .56]);

xlim ([D(1), D(end)]);
xlabel ('Baseline   [km]');
ylabel ('Distance   [AU]');
legend ({' 200 km   resel', ' 20   km   resel', ' 1     km   resel'}, 'Location', 'northwest', 'EdgeColor', [0.9 0.9 0.9]);
text(8*20^(-2), 9*10^5, 'Proxima Centauri', 'Color', [0.49 .18 .56]);

    yyaxis right
    ylim ([distLY(1) distLY(end)]);
    set(gca,'YScale','log');
    ylabel('Distance   [LY]');
    plt = gca;
    plt.YAxis(2).Color = [0.3 0.3 0.3] ;
    