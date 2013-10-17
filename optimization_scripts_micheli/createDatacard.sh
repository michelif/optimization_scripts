#!/bin/sh

tag=Jun25_apocalypse

for i in $(seq 1 1 100)
    do
  echo $i
#####btag
#compute rate for sig and bkg
cat <<EOF >OPT/btag_$tag/datacard/createDatacard$i.C
{
  float csScaleFactor=1./2.68;
  float FWHMscaleFactor=0.0448;
  float signalSF=0.75;

  TString dir="OPT";


    TString signalFileName=dir+"/btag_$tag/signalOptwg";
    signalFileName+=$i;
    signalFileName+=".root";

    TString csFileName=dir+"/btag_$tag/optwg";
    csFileName+=$i;
    csFileName+=".root";

    TString gghFileName=dir+"/btag_$tag/signal_ggh_Optwg";
    gghFileName+=$i;
    gghFileName+=".root";


    TFile* signalFile=TFile::Open(signalFileName);
    TFile* csFile=TFile::Open(csFileName);
    TFile* gghFile=TFile::Open(gghFileName);

    TTree* tree_signal=signalFile->Get("tree_passedEvents");
    TTree* tree_cs=csFile->Get("tree_passedEvents");
    TTree* tree_ggh=gghFile->Get("tree_passedEvents");

    tree_cs->Draw("PhotonsMass>>hcs","(category==6)*(pt_eta_scaled_2D_weight_data)");
    float n_cs=((float)hcs->Integral())*FWHMscaleFactor*csScaleFactor;

    tree_signal->Draw("PhotonsMass>>m_sig","weight");
    float n_sig=(m_sig->Integral())*signalSF;

    tree_ggh->Draw("PhotonsMass>>m_sig","weight");
    float n_ggh=(m_sig->Integral())*signalSF;


    cout<<"rate      "<<n_sig<<"    "<<n_cs<<"   "<<n_ggh<<endl;
    //    cout<<"n_sig: "<<n_sig<<" n_cs:"<<n_cs<<" nggh:"<<n_ggh<<" s/sqrt(b) "<<n_sig/sqrt(n_cs+n_ggh)<<endl;

  

}
EOF

#create datacard
root -b -q OPT/btag_$tag/datacard/createDatacard$i.C > OPT/btag_$tag/datacard/rate$i.dat
line=`cat OPT/btag_$tag/datacard/rate$i.dat |grep rate`
line2="-i 's|rate|"$line"|' OPT/btag_$tag/datacard/datacard$i.dat"

cat<<EOF2 >OPT/btag_$tag/datacard/datacard$i.dat
# Simple counting experiment, with one signal and one background process
# Extremely simplified version of the 35/pb H->WW analysis for mH = 200 GeV,
# for 4th generation exclusion (EWK-10-009, arxiv:1102.5429v1)
imax 1  number of channels
jmax 2  number of backgrounds 
kmax 2  number of nuisance parameters (sources of systematical uncertainties)
------------
# we have just one channel, in which we observe 0 events
bin         1
observation 0
------------
# now we list the expected events for signal and all backgrounds in that bin
# the second 'process' line must have a positive number for backgrounds, and 0 for signal
# then we list the independent sources of uncertainties, and give their effect (syst. error)
# on each process and bin
bin             1      1       1
process       VH     Bckg     ggH 
process         0      1       2
rate
------------
deltaB    lnN      -   1.30 -  
deltaggH  lnN      -   -    1.35  
EOF2

#cat  OPT/btag_$tag/datacard/datacard$i.dat|grep rate
eval sed $line2
#cat  OPT/btag_$tag/datacard/datacard$i.dat|grep rate

combine --verbose=2 -M MaxLikelihoodFit -S 1  OPT/btag_$tag/datacard/datacard$i.dat -t -1 --expectSignal=1 --rMin=-30 --rMax=30 | grep "Best fit" >>OPT/btag_$tag/datacard/limits.txt

#####notag
#compute rate for sig and bkg
cat <<EOF >OPT/notag_$tag/datacard/createDatacard$i.C
{
  float csScaleFactor=1./2.68;
  float FWHMscaleFactor=0.0448;
  float signalSF=0.75;

  TString dir="OPT";


    TString signalFileName=dir+"/notag_$tag/signalOptwg";
    signalFileName+=$i;
    signalFileName+=".root";

    TString csFileName=dir+"/notag_$tag/optwg";
    csFileName+=$i;
    csFileName+=".root";

    TString gghFileName=dir+"/notag_$tag/signal_ggh_Optwg";
    gghFileName+=$i;
    gghFileName+=".root";


    TFile* signalFile=TFile::Open(signalFileName);
    TFile* csFile=TFile::Open(csFileName);
    TFile* gghFile=TFile::Open(gghFileName);

    TTree* tree_signal=signalFile->Get("tree_passedEvents");
    TTree* tree_cs=csFile->Get("tree_passedEvents");
    TTree* tree_ggh=gghFile->Get("tree_passedEvents");

    tree_cs->Draw("PhotonsMass>>hcs","(category==7)*(pt_eta_scaled_2D_weight_data)");
    float n_cs=((float)hcs->Integral())*FWHMscaleFactor*csScaleFactor;

    tree_signal->Draw("PhotonsMass>>m_sig","weight");
    float n_sig=(m_sig->Integral())*signalSF;

    tree_ggh->Draw("PhotonsMass>>m_sig","weight");
    float n_ggh=(m_sig->Integral())*signalSF;


   cout<<"rate      "<<n_sig<<"    "<<n_cs<<"   "<<n_ggh<<endl;
    //    cout<<"n_sig: "<<n_sig<<" n_cs:"<<n_cs<<" nggh:"<<n_ggh<<" s/sqrt(b) "<<n_sig/sqrt(n_cs+n_ggh)<<endl;

  

}
EOF

#create datacard
root -b -q OPT/notag_$tag/datacard/createDatacard$i.C > OPT/notag_$tag/datacard/rate$i.dat
line=`cat OPT/notag_$tag/datacard/rate$i.dat |grep rate`
line2="-i 's|rate|"$line"|' OPT/notag_$tag/datacard/datacard$i.dat"

cat<<EOF2 >OPT/notag_$tag/datacard/datacard$i.dat
# Simple counting experiment, with one signal and one background process
# Extremely simplified version of the 35/pb H->WW analysis for mH = 200 GeV,
# for 4th generation exclusion (EWK-10-009, arxiv:1102.5429v1)
imax 1  number of channels
jmax 2  number of backgrounds 
kmax 2  number of nuisance parameters (sources of systematical uncertainties)
------------
# we have just one channel, in which we observe 0 events
bin         1
observation 0
------------
# now we list the expected events for signal and all backgrounds in that bin
# the second 'process' line must have a positive number for backgrounds, and 0 for signal
# then we list the independent sources of uncertainties, and give their effect (syst. error)
# on each process and bin
bin             1      1       1
process       VH     Bckg     ggH 
process         0      1       2
rate
------------
deltaB    lnN      -   1.30 -  
deltaggH  lnN      -   -    1.35  
EOF2

#cat  OPT/notag_$tag/datacard/datacard$i.dat|grep rate
eval sed $line2
#cat  OPT/notag_$tag/datacard/datacard$i.dat|grep rate

combine --verbose=2 -M MaxLikelihoodFit -S 1  OPT/notag_$tag/datacard/datacard$i.dat -t -1 --expectSignal=1 --rMin=-30 --rMax=30 | grep "Best fit" >>OPT/notag_$tag/datacard/limits.txt



done


cat OPT/btag_$tag/datacard/limits.txt  |cut -d "+" -f2|awk '{print $1}'  > OPT/btag_$tag/datacard/limits_right.txt
cat OPT/notag_$tag/datacard/limits.txt  |cut -d "+" -f2|awk '{print $1}'  > OPT/notag_$tag/datacard/limits_right.txt