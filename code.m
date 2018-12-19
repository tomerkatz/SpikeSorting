load('r');
importdata('mC41_33.sst');
load('idx');
Lratio=ans.Lratio;
ID=ans.ID;
ISIindx=ans.ISIindex;
frate=ans.frate;
pyr=ans.pyr;

corrTP=nanmean(r.corr.TP(idx,:),2);
mahTP=nanmean(r.mahal.TP(idx,:),2);
cosTP=nanmean(r.cosine.TP(idx,:),2);
eucTP=nanmean(r.eucl.TP(idx,:),2);

corrTN=1-nanmean(r.corr.FP(idx,:),2);
mahTN=1-nanmean(r.mahal.FP(idx,:),2);
eucTN=1-nanmean(r.eucl.FP(idx,:),2);
cosTN=1-nanmean(r.cosine.FP(idx,:),2);


corFP=nanmean(r.corr.FP(idx,:),2);
mahFP=nanmean(r.mahal.FP(idx,:),2);
cosFP=nanmean(r.cosine.FP(idx,:),2);
eucFP=nanmean(r.eucl.FP(idx,:),2);

figure;scatter(-log(ISIindx).*-log(Lratio),(corrTP.*corrTN),[],(pyr),'filled');colorbar
xlabel('log(Lratio) X log(ISIindex)'),ylabel('TPXTN');title('correlation Distance');
line( 8.9*[1 1 ], ylim,'color', [ 1 0 0 ], 'linestyle', '--' );
line( 4.38*[1 1 ], ylim,'color', [ .128 .128 .128 ], 'linestyle', '--' );
line( xlim, 0.81*[1 1 ], 'color', [ 1 0 0 ], 'linestyle', '--' ); 

figure;scatter(eucTP,corrTP,[],pyr,'filled');ylim([0 1]);xlim([0 1]);
xlabel('Euclidian TP'),ylabel('Correlation TP');title('Euclidian VS Corrlation Distance');
line( 1*[0 1 ],ylim,'color', [ 1 0 0 ], 'linestyle', '--' );
line( 4.38*[1 1 ], ylim,'color', [ .128 .128 .128 ], 'linestyle', '--' );

figure;bar(sort(corrTP));title('correlation');xlabel('Unit'); ylabel('TP rate');

figure;scatter(log(ID),-log(Lratio),'filled');lsline
xlabel('(ID)'),ylabel('(Lratio)');title('Lratio ID');

