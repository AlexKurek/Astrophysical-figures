clr;
musecProximaB = 71.0441;

tickCount = 50;
D = exp(linspace(log(2.45), log(10^5), tickCount));
lambda = 550*10^(-9);
resolution = 1.22*lambda./D;
theta = rad2deg(resolution);
thetaDMS = degrees2dms(theta);
resSec = thetaDMS(:, 3);
resMuSec = resSec*10^6;
pixels =  musecProximaB./resMuSec;

loglog (D, pixels, '.'); xlabel ('D   [m]','FontSize',14); ylabel ({'Proxima Centauri B' 'image pixels'},'FontSize',14);
    hold on;
    plot (2.45, 10^(-3), 'ro');
    hold on;
    plot (D, ones(tickCount), '--');
    hold on;
    plot (D, repmat(5, tickCount), '--');   
    hold off
    legend ('Hypertelescope', 'HST', '1\times1 pix.', '5\times5 pix.', 'Location', 'southeast'); legend boxoff

