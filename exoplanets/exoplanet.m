% https://pl.wikipedia.org/wiki/Proxima_Centauri_b
% http://exoplanet.eu/catalog/proxima_cen_b/
clr;

distanceLY = 4.321;
distanceKM = distanceLY * 9.4605284*10^12;
HSTres = 0.12;
biggerBy = 1.1; % domys³
egzoplanetDiam = biggerBy*2*6400;
angSize = egzoplanetDiam / distanceKM;
angSize = degrees2dms(rad2deg(angSize));

arcesc = angSize(3);
misecs = (10^3)*angSize(3);
musecs = (10^6)*angSize(3);

HSTfactor = HSTres/arcesc;
forEHT = musecs/25;

disp([num2str(arcesc) ' arcsec']);
disp([num2str(misecs) ' mas']);
disp([num2str(musecs) ' µas']);
fprintf ( '\n');
disp([num2str(round(HSTfactor)) 'x  too small for HST']);
disp([num2str(round(forEHT)) '  pixels in EHT']);
