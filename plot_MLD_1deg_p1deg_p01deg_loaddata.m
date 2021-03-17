%This makes the first figure for the initially-submitted mansuscript. The updated paper uses as its first figure one made with plot_mld03.m
%OUT OF DATE NOT RECOMMENDED


% run this with 028 and _2100 vs 027 and ROMS yr 2000 conditions
restoredefaultpath;
clear all
close all;

load('/glade/scratch/dwhitt/fig1_Richardsetal_data.mat',...
    'lon_rho','lat_rho','ROMSXBLTFeb152014','ROMSXBLTFeb152114',...
    'HRLONG','HRLAT','POPHRXBLT2000','POPHRXBLT2100',...
    'LRLONG','LRLAT','POPLRXBLT2000','POPLRXBLT2100','maskHR','maskLR')
figure;
subplot(3,3,1),...
contourf(lon_rho',lat_rho',abs(ROMSXBLTFeb152014'),linspace(0,400,41),'linestyle','none'); 
caxis([0 300]);
xlabel('Longitude')
ylabel('Latitude')
title('(a) 0.01^o, present','fontweight','normal')
grid on
set(gca,'layer','top')
cbh=colorbar;
ylabel(cbh,'Max OSBL depth [m]');


subplot(3,3,2),...
contourf(lon_rho',lat_rho',abs(ROMSXBLTFeb152114'),linspace(0,400,41),'linestyle','none'); 
caxis([0 300]);
xlabel('Longitude')
ylabel('Latitude')
title('(b) 0.01^o, future','fontweight','normal')
grid on
set(gca,'layer','top')
cbh=colorbar;
ylabel(cbh,'Max OSBL depth [m]');

subplot(3,3,3),...
        histogram(abs(ROMSXBLTFeb152114(:)),linspace(0,400,21),'facecolor','r','normalization','probability','FaceAlpha',.2,'edgecolor','none');
hold on
plot(nanmean(abs(ROMSXBLTFeb152114(:))).*ones(3,1),linspace(0,.05,3),'r-','linewidth',2)
        histogram(abs(ROMSXBLTFeb152014(:)),linspace(0,400,21),'facecolor','b','normalization','probability','FaceAlpha',.2,'edgecolor','none');
plot(nanmean(abs(ROMSXBLTFeb152014(:))).*ones(3,1),linspace(0,.05,3),'b-','linewidth',2)

xlim([0 400]);
title('(c) 0.01^o ','fontweight','normal')
grid on
xlabel('[m]')
        ylim([0 .6])

%ylim([0 .03])


subplot(3,3,4),...
contourf(HRLONG',HRLAT',abs(POPHRXBLT2000'),linspace(0,400,41),'linestyle','none'); 
caxis([0 300]);
xlabel('Longitude')
ylabel('Latitude')
title('(d) 0.1^o, present','fontweight','normal')
grid on
set(gca,'layer','top')
cbh=colorbar;
ylabel(cbh,'Max OSBL depth [m]');


subplot(3,3,5),...
contourf(HRLONG',HRLAT',abs(POPHRXBLT2100'),linspace(0,400,41),'linestyle','none'); 
caxis([0 300]);
xlabel('Longitude')
ylabel('Latitude')
title('(e) 0.1^o, future','fontweight','normal')
grid on
set(gca,'layer','top')
cbh=colorbar;
ylabel(cbh,'Max OSBL depth [m]');

subplot(3,3,6),...
        histogram(abs(POPHRXBLT2100(maskHR)),linspace(0,400,21),'facecolor','r','normalization','probability','FaceAlpha',.2,'edgecolor','none');
hold on
plot(nanmean(abs(POPHRXBLT2100(maskHR))).*ones(3,1),linspace(0,.05,3),'r-','linewidth',2)
        histogram(abs(POPHRXBLT2000(maskHR)),linspace(0,400,21),'facecolor','b','normalization','probability','FaceAlpha',.2,'edgecolor','none');
plot(nanmean(abs(POPHRXBLT2000(maskHR))).*ones(3,1),linspace(0,.05,3),'b-','linewidth',2)

        xlim([0 400]);
title('(f) 0.1^o ','fontweight','normal')
grid on
xlabel('[m]')
        ylim([0 .6])

%ylim([0 .03])

subplot(3,3,7),...
contourf(LRLONG',LRLAT',abs(POPLRXBLT2000'),linspace(0,400,41),'linestyle','none');
caxis([0 300]);
xlabel('Longitude')
ylabel('Latitude')
title('(g) 1.0^o, present','fontweight','normal')
grid on
set(gca,'layer','top')
cbh=colorbar;
ylabel(cbh,'Max OSBL depth [m]');


subplot(3,3,8),...
contourf(LRLONG',LRLAT',abs(POPLRXBLT2100'),linspace(0,400,41),'linestyle','none');
caxis([0 300]);
xlabel('Longitude')
ylabel('Latitude')
title('(h) 1.0^o, future','fontweight','normal')
grid on
set(gca,'layer','top')
cbh=colorbar;
ylabel(cbh,'Max OSBL depth [m]');

subplot(3,3,9),...
        histogram(abs(POPLRXBLT2100(maskLR)),linspace(0,400,21),'facecolor','r','normalization','probability','FaceAlpha',.2,'edgecolor','none');
hold on
plot(nanmean(abs(POPLRXBLT2100(maskLR))).*ones(3,1),linspace(0,.05,3),'r-','linewidth',2)

        histogram(abs(POPLRXBLT2000(maskLR)),linspace(0,400,21),'facecolor','b','normalization','probability','FaceAlpha',.2,'edgecolor','none');
plot(nanmean(abs(POPLRXBLT2000(maskLR))).*ones(3,1),linspace(0,.05,3),'b-','linewidth',2)

        xlim([0 400]);
        ylim([0 .6])
title('(i) 1.0^o ','fontweight','normal')
grid on
%ylim([0 .03])
set(gcf,'color','w')
xlabel('[m]')
%print(gcf,'fig1_roms_SBL_Feb15_yr3.pdf','-painters','-dpdf','-bestfit')
%print(gcf,'fig1_roms_SBL_Feb15_yr3.png','-r200','-dpng');
%addpath ./export_fig-master/
%export_fig fig_SST_SSS_MLD_mar01_027vs028_withROMS.png -r300

 
