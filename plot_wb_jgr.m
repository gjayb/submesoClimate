clear all

res='05_1.25km';
res2='125km';
mlds='mld03m';

nt=741;
nt_spec=227;

nw=3;

otd=4046.5;


load(strcat('meanuvwb_36hr_',res,'_all.mat'),'meanuvwb');
ocean_day_36hr=(meanuvwb.ocean_time)/(24*3600)-otd;
ocean_day_36hrp=(meanuvwb.ocean_time)/(24*3600)+5; % plus 5 to correct datevec
ocean_time36hr=meanuvwb.ocean_time;
wb36hr=meanuvwb.wb;
wbq=meanuvwb.wbq;
wbstd=meanuvwb.wbstd;
z36=meanuvwb.z;
n36=find(z36==100);

res='05_1.25km_2100';
res2='125km';
mlds='mld032m';


load(strcat('meanuvwb_36hr_',res,'_all.mat'),'meanuvwb');
ocean_day_36hr_2100=(meanuvwb.ocean_time)/(24*3600)-otd;
ocean_day_36hr_2100p=(meanuvwb.ocean_time)/(24*3600)+5;
wb36hr_2100=meanuvwb.wb;
wbq_2100=meanuvwb.wbq;
wbstd_2100=meanuvwb.wbstd;




load MLD_timeseries
ocean_day=ocean_time/(24*3600)-otd;
mld2000=MLDmean2000;
mld2100=MLDmean2100;

mld2000(mld2000<10)=10;
mld2100(mld2100<10)=10;


mld2000i36hr=interp1(ocean_day,mld2000,ocean_day_36hr);
mld2100i36hr=interp1(ocean_day,mld2100,ocean_day_36hr_2100);





[na nb]=size(wb36hr);
for j=1:nb
    jj=find(z36<mld2000i36hr(j));
    wb36hrmax(j)=max(wb36hr(jj,j));
    zmax(j)=z36(find(wb36hr(:,j)==max(wb36hrmax(j))));
end

[na nb]=size(wb36hr_2100);
for j=1:nb
    jj=find(z36<mld2100i36hr(j));
    wb36hrmax2100(j)=max(wb36hr_2100(jj,j));
    zmax2100(j)=z36(find(wb36hr_2100(:,j)==max(wb36hrmax2100(j))));
end


hw=2;
nf=2;
wb36hrmaxf=filter_data(wb36hrmax,hw,nf);
wb36hrmaxf2100=filter_data(wb36hrmax2100,hw,nf);


% FFH scaling


    load pden_timeseries_jan2020
    
time2000=ocean_time2000./86400;
time2100=ocean_time2100./86400;
time2000p=ocean_time2000./86400+5;
time2100p=ocean_time2100./86400+5;

timestart=time2000(1);
time2000=time2000-timestart;
time2100=time2100-timestart;



figure;


hold on

cffh=0.08 
h1=plot(time2000,0.08*wbML2000_mean,'b--','LineWidth',2);
h2=plot(time2000,0.08*wbML2100_mean,'r--','LineWidth',2);

h4=plot(ocean_day_36hr,wb36hrmaxf,'b','LineWidth',2);
h5=plot(ocean_day_36hr_2100,wb36hrmaxf2100,'r','LineWidth',2);


axis([600 1200 0 3e-8])
xlabel('Day')
ylabel('max <w''b''> (m^2s^{-3})')
set(gca,'FontSize',15)
box on
%grid on
%legend([h4 h5 h1 h2],{'36hr 2000','36hr 2100','FFH 2000','FFH 2100'})

axis([ocean_day_36hr(end)-600 ocean_day_36hr(end) 0 3e-8])
%gregaxm_noyear(ocean_day_36hrp,1)
set(gca,'DataAspectRatio',[1.8e10 1 1])
set(gca,'LineWidth',1)
orient('LandScape')

figure

h=area(ocean_day,[gradbqtiles2000(:,1) (gradbqtiles2000(:,9)-gradbqtiles2000(:,1))],'linestyle','none','handlevisibility','off');
h(1).FaceColor='w';
h(2).FaceColor='b';
h(1).FaceAlpha=0;
h(2).FaceAlpha=0.2;

hold on

h=area(ocean_day,[gradbqtiles2100(:,1) (gradbqtiles2100(:,9)-gradbqtiles2100(:,1))],'linestyle','none','handlevisibility','off');
h(1).FaceColor='w';
h(2).FaceColor='r';
h(1).FaceAlpha=0;
h(2).FaceAlpha=0.2;

plot(ocean_day,gradb2000_mean,'b','LineWidth',3)
hold on
plot(ocean_day,gradb2100_mean,'r','LineWidth',3)

xlabel('Day')
ylabel('<|\nabla b|> (s^{-2})')
title('Mean |\nabla b|','FontSize',18)
%legend('2000','2100')


axis([0 1200 0 2.5e-7])
set(gca,'FontSize',18)
box on
grid on
orient('LandScape')

load MLD_timeseries_jan2020

figure

h=area(ocean_day,[MLDqtiles2000(:,1) (MLDqtiles2000(:,9)-MLDqtiles2000(:,1))],'linestyle','none','handlevisibility','off');
h(1).FaceColor='w';
h(2).FaceColor='b';
h(1).FaceAlpha=0;
h(2).FaceAlpha=0.2;

hold on

h=area(ocean_day,[MLDqtiles2100(:,1) (MLDqtiles2100(:,9)-MLDqtiles2100(:,1))],'linestyle','none','handlevisibility','off');
h(1).FaceColor='w';
h(2).FaceColor='r';
h(1).FaceAlpha=0;
h(2).FaceAlpha=0.2;

plot(ocean_day,MLDmean2000,'b','LineWidth',3)

plot(ocean_day,MLDmean2100,'r','LineWidth',3)

xlabel('Day')
ylabel('Depth (m)')
title('Mean MLD','FontSize',18)
%legend('2000','2100')
set(gca,'YDir','reverse')

axis([0 1200 0 300])
set(gca,'FontSize',18)
box on
grid on
orient('LandScape')

figure
hold on

n1=740;
n2=740;

wbstdp=[0 squeeze(nanmean(wbstd(:,n1:n2),2))'];
wbq10=[0 squeeze(mean(wbq(1:50,1,n1:n2),3))'];
wbq90=[0 squeeze(mean(wbq(1:50,9,n1:n2),3))'];
wbq20=[0 squeeze(mean(wbq(1:50,2,n1:n2),3))'];
wbq80=[0 squeeze(mean(wbq(1:50,8,n1:n2),3))'];
wbq30=[0 squeeze(mean(wbq(1:50,3,n1:n2),3))'];
wbq70=[0 squeeze(mean(wbq(1:50,7,n1:n2),3))'];

wbsm=[0 squeeze(mean(wb36hr(:,n1:n2),2)-mean(wbstd(:,n1:n2),2))'];
wbsp=[0 squeeze(mean(wb36hr(:,n1:n2),2)+mean(wbstd(:,n1:n2),2))'];

patch([wbq20 flip(wbq80)],[0 z36(1:50) flip([0 z36(1:50)])],'b','FaceAlpha',0.2,'EdgeColor','none')

wbstd_2100p=[0 squeeze(nanmean(wbstd_2100(:,n1:n2),2))'];
wbq10_2100=[0 squeeze(mean(wbq_2100(1:50,1,n1:n2),3))'];
wbq90_2100=[0 squeeze(mean(wbq_2100(1:50,9,n1:n2),3))'];
wbq20_2100=[0 squeeze(mean(wbq_2100(1:50,2,n1:n2),3))'];
wbq80_2100=[0 squeeze(mean(wbq_2100(1:50,8,n1:n2),3))'];
wbq30_2100=[0 squeeze(mean(wbq_2100(1:50,3,n1:n2),3))'];
wbq70_2100=[0 squeeze(mean(wbq_2100(1:50,7,n1:n2),3))'];

patch([wbq20_2100 flip(wbq80_2100)],[0 z36(1:50) flip([0 z36(1:50)])],'r','FaceAlpha',0.2,'EdgeColor','none')

plot([0 0],[0 300],'k')

x1=-3e-8;
x2=5e-8;
h3=plot([0 mean(wb36hr(:,n1:n2),2)'],[0 z36],'b','LineWidth',4);
h5=plot([0 mean(wb36hr_2100(:,n1:n2),2)'],[0 z36],'r','LineWidth',4);
plot([x1 x2],[mean(mld2000i36hr(n1:n2)) mean(mld2000i36hr(n1:n2))],'b','LineWidth',1.5)
plot([x1 x2],[mean(mld2100i36hr(n1:n2)) mean(mld2100i36hr(n1:n2))],'r','LineWidth',1.5)
set(gca,'YDir','reverse','FontSize',28,'YLim',[0 300],'XLim',[x1 x2],'LineWidth',1)
xlabel('<w''b''> (m^2s^{-3})')
ylabel('Depth (m)')
title('<w''b''>: blue 2000, red 2100','FontSize',18)
%legend([h3 h5],{'2000','2100'})
box on
orient('tall')

