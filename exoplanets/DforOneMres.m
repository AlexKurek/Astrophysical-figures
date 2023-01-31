clr;

lambda = 550*10^(-9);
LY = 9.4605284*10^12; % m
AU = 149597871; % km

distLY = 4.207;
distKM = distLY*LY;

biggerBy = 1.1; % domys³
egzoplanetDiam = biggerBy*2*6400;

oneMangSize = 1 / distKM; % rad

onePixThereKM = 1.22*550*10^(-9)/oneMangSize;
onePixThereAU = onePixThereKM/AU;

disp (['Min. D:   ' num2str(round(onePixThereKM)) ' km']);
disp (['Min. D:   ' num2str(onePixThereAU) ' AU']);