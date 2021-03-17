% change labelling of longitude

xticks=get(gca,'XTick');
xtlabel=get(gca,'XTickLabel');
if iscell(xtlabel)
    na=length(xtlabel);
    for jt=1:na
        xtlabelnum(jt)=str2num(xtlabel{jt});
    end
else
    xtlabelnum=str2num(xtlabel);
end
[na nb]=size(xtlabel);
clear xtlabelp
for i=1:na
if xtlabelnum(i) < 0
xt = [num2str(-xtlabelnum(i)) 'W'];
elseif xtlabelnum(i) < 180
xt = [num2str(xtlabelnum(i)) 'E'];
elseif xtlabelnum(i) > 180
xt = [num2str(360-xtlabelnum(i)) 'W'];
else
xt = num2str(xtlabelnum(i));
end
[xa xb]=size(xt);

xtlabelp(i,1:xb)=xt;
end

set(gca,'XTickLabel',xtlabelp)
set(gca,'XTick',xticks)

return
