clear

load mld03_2100v

x=[0:5:500];
xm=0.5*(x(1:end-1)+x(2:end));
pd=histogram(mld03(:),x);
pd2100v=pd.Values/length(mld03(:));


figure
ci=[0:.05:1]*150;
cc=[0 1]*150;
contourf(lon_rho,lat_rho,mld03,ci)
hold on
contour(lon_rho,lat_rho,mld03,ci)
caxis(cc)

rcolormap(ci);
colorbar
set(gca,'DataAspectRatio',[1 1 1])
set(gca,'FontSize',16)
%xlabel('Longitude','FontSize',16)
%ylabel('Latitude','FontSize',16)
axis([-25.5 -13.5 41 50])
%title('MLD 2100 visc','FontSize',18)
xticks([-24:2:-14])
yticks([42:2:50])
label_long
label_lat_y

load mld03_2100

pd=histogram(mld03(:),x);
pd2100=pd.Values/length(mld03(:));


figure
ci=[0:.05:1]*150;
cc=[0 1]*150;
contourf(lon_rho,lat_rho,mld03,ci)
hold on
contour(lon_rho,lat_rho,mld03,ci)
caxis(cc)

rcolormap(ci);
colorbar
set(gca,'DataAspectRatio',[1 1 1])
set(gca,'FontSize',16)
%xlabel('Longitude','FontSize',16)
%ylabel('Latitude','FontSize',16)
axis([-25.5 -13.5 41 50])
%title('MLD 2100','FontSize',18)
clear xticks yticks
xticks([-24:2:-14])
yticks([42:2:50])
label_long
label_lat_y

load mld03_2000v

pd=histogram(mld03(:),x);
pd2000v=pd.Values/length(mld03(:));


figure
ci=[0:.05:1]*300;
cc=[0 1]*300;
contourf(lon_rho,lat_rho,mld03,ci)
hold on
contour(lon_rho,lat_rho,mld03,ci)
caxis(cc)

rcolormap(ci);
colorbar
set(gca,'DataAspectRatio',[1 1 1])
set(gca,'FontSize',16)
%xlabel('Longitude','FontSize',16)
%ylabel('Latitude','FontSize',16)
axis([-25.5 -13.5 41 50])

%title('MLD 2000 visc','FontSize',18)
clear xticks yticks
xticks([-24:2:-14])
yticks([42:2:50])
label_long
label_lat_y


load mld03_2000

pd=histogram(mld03(:),x);
pd2000=pd.Values/length(mld03(:));

figure
ci=[0:.05:1]*300;
cc=[0 1]*300;
contourf(lon_rho,lat_rho,mld03,ci)
hold on
contour(lon_rho,lat_rho,mld03,ci)
caxis(cc)
set(gca,'DataAspectRatio',[1 1 1])
rcolormap(ci);
colorbar

set(gca,'FontSize',16)
%xlabel('Longitude','FontSize',16)
%ylabel('Latitude','FontSize',16)
axis([-25.5 -13.5 41 50])

%title('MLD 2000','FontSize',18)
clear xticks yticks
xticks([-24:2:-14])
yticks([42:2:50])
label_long
label_lat_y

figure
bar(xm,pd2000,'FaceColor','b','FaceAlpha',0.3,'BarWidth',1,'LineStyle','none')
hold on
bar(xm,pd2000v,'FaceColor','r','FaceAlpha',0.3,'BarWidth',1,'LineStyle','none')
set(gca,'FontSize',16)
clear yticks
yticks([0 0.01 0.02 0.03])
xlabel('(m)')

figure
bar(xm,pd2100,'FaceColor','b','FaceAlpha',0.3,'BarWidth',1,'LineStyle','none')
hold on
bar(xm,pd2100v,'FaceColor','r','FaceAlpha',0.3,'BarWidth',1,'LineStyle','none')
set(gca,'FontSize',16)
clear yticks
yticks([0 0.04 0.08 0.12])
xlabel('(m)')



