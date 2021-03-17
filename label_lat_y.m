% change labelling of longitude

yticks=get(gca,'YTick');
ytlabel=get(gca,'YTickLabel');
if iscellstr(ytlabel)==1
ytlabel=char(ytlabel);
end
ytlabelnum=str2num(ytlabel);
[na nb]=size(ytlabel);
clear ytlabelp
for i=1:na
if ytlabelnum(i) < 0
yt = [num2str(-ytlabelnum(i)) 'S'];
elseif ytlabelnum(i) > 0
yt = [num2str(ytlabelnum(i)) 'N'];
else
yt='EQ';
end
[ya yb]=size(yt);
ytlabelp(i,1:yb)=yt;
end

set(gca,'YTickLabel',ytlabelp)
set(gca,'YTick',yticks)

return
