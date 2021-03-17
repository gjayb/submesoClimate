
clear all
res='05_1.25km';
res2='125km';


dayp=5157.5;

load(strcat('spectra_36hr_deep_',res,'_all.mat'),'spectra');
spectra_deep=spectra;
ocean_day_deep=(spectra.ocean_time)/(24*3600);
logrb_deep=log10(spectra.radialbands);

nt_deep=max(find(ocean_day_deep<dayp));





load(strcat('spectra_36hr_',res,'_all.mat'),'spectra');
ocean_day_spec=(spectra.ocean_time)/(24*3600);
logrb=log10(spectra.radialbands);

nt_spec=max(find(ocean_day_spec<dayp));


load MLD_timeseries
ocean_day=ocean_time/(24*3600);
if length(res)==9
    mld=-MLDmean2000;
else
    mld=-MLDmean2100;
end
nt=max(find(ocean_day<dayp));


z=spectra.z;

nw=3;
figure
logkezp=log10(squeeze(mean(spectra.wwspec(:,:,nt_spec-nw:nt_spec+nw),3))*spectra.radialbands(1));
nwd=0;
spectra_deep.wwspec(spectra_deep.wwspec<1e-10)=1e-10;
logkezp_deep=log10(squeeze(mean(spectra_deep.wwspec(:,:,nt_deep-nw:nt_deep+nw),3))*spectra_deep.radialbands(1));
zc=[spectra.z spectra_deep.z(7:end)];
logkezp=cat(2,logkezp,logkezp_deep(:,7:end));
logkezp=real(logkezp);

ci=[-8:0.2:-3];
cc=[-8 -3];
logkezp(logkezp<min(ci))=min(ci);
contourf(logrb,zc,logkezp',ci)
hold on
contour(logrb,zc,logkezp',ci)
plot([logrb(1) logrb(end)],[-mld(nt) -mld(nt)],'k','LineWidth',2)
caxis(cc)
colormap(jet(length(ci)-1));
colorbar
set(gca,'YDir','reverse','FontSize',18)
set(gca,'XLim',[logrb(2) logrb(end)])
set(gca,'YLim',[zc(1) 500])

xlabel('cyc/m','FontSize',18)
ylabel('Depth (m)','FontSize',18)
title(['log_{10}(Vert. KE (m^2s^{-2}(cyc/m)^{-1}): Day=',num2str(ocean_day_spec(nt_spec))],'FontSize',16)


