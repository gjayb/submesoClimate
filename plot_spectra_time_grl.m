
clear all
res='05_1.25km';
%res='05_1.25km_2100';

%load(strcat('spectra_',res,'_all.mat'),'spectra');

%ods=spectra.ocean_time(1);

load(strcat('spectra_36hr_',res,'_all.mat'),'spectra');
ocean_day=(spectra.ocean_time)/(24*3600)+5; % plus 5 to correct datevec
logrb=log10(spectra.radialbands);

z=spectra.z;

if length(res)==14
z1=6;
else
z1=11;
end

keh=0.5*(spectra.uuspec+spectra.vvspec)*spectra.radialbands(1);
kehm=nanmean(nanmean(keh(:,:,400:800),3),2);
kehp=squeeze(keh(:,z1,:));
[na nb]=size(kehp);
hw=6;
nf=2;
for j=1:na
    kehpf(j,:)=filter_data(kehp(j,:),hw,nf);
end

figure
logkehp=log10(kehpf);
ci=[-0.5:0.1:3.5];
cc=[-0.5 3.5];
logkehp(logkehp<min(ci))=min(ci);
contourf(ocean_day,logrb,logkehp,ci)
hold on
contour(ocean_day,logrb,logkehp,ci)
caxis(cc)
colormap(jet(length(ci)-1));
colorbar
set(gca,'YDir','reverse','FontSize',18)
axis([ocean_day(end)-600 ocean_day(end) logrb(2) logrb(end)])
gregaxm_noyear(ocean_day,1)
%xlabel('Day','FontSize',18)
ylabel('cyc/m','FontSize',18)
%title(['log_{10}(Horz. KE (m^2s^{-2}(cyc/m)^{-1}): z=',num2str(z(z1)),'m'],'FontSize',18)
orient('LandScape')

figure

%logkezp=log10(squeeze(spectra.wwspec(:,z1,:))*spectra.radialbands(1));
kev=spectra.wwspec*spectra.radialbands(1);
kevp=squeeze(kev(:,z1,:));
[na nb]=size(kevp);
hw=3;
nf=2;
for j=1:na
    kevpf(j,:)=filter_data(kevp(j,:),hw,nf);
end

%wbp=squeeze(real(spectra.wbspec(:,z1,:)))*spectra.radialbands(1);
%wbp(wbp<=0)=1e-10;
logkezp=log10(kevpf);
ci=[-8:0.2:-3];
cc=[-8 -3];
logkezp(logkezp<min(ci))=min(ci);
contourf(ocean_day,logrb,logkezp,ci)
hold on
contour(ocean_day,logrb,logkezp,ci)
caxis(cc)
colormap(jet(length(ci)-1));
colorbar
set(gca,'YDir','reverse','FontSize',18)
axis([ocean_day(end)-600 ocean_day(end) logrb(2) logrb(end)])
gregaxm_noyear(ocean_day,1)
%xlabel('Day','FontSize',18)
ylabel('cyc/m','FontSize',18)
%title(['log_{10}(Vert. KE (m^2s^{-2}(cyc/m)^{-1}): z=',num2str(z(z1)),'m'],'FontSize',18)
orient('LandScape')

wbspec=real(spectra.wbspec)*spectra.radialbands(1);
wbp=squeeze(wbspec(:,z1,:));
[na nb]=size(wbp);
hw=3;
nf=2;
for j=1:na
    wbpf(j,:)=filter_data(wbp(j,:),hw,nf);
end






