#!/bin/sh

tag=Jun25_apocalypse

for i in $(seq 0 1 10)
    do
    startfile=($i*10)
    endfile=($i+1)*10

cat <<EOF >OPT/btag_$tag/createTree$i.C
{
    TString dir="OPT";
    TString btagOptFile[100];
  TString btagOutFile_data[100];
  TString btagOutFile_vh[100];
  TString btagOutFile_ggh[100];

  for (int i=$startfile;i<$endfile;i++) {

    btagOptFile[i]=dir+"/btag_$tag/opt";
    //    btagptFile[i]+=(i+1)*10;
    btagOptFile[i]+=(i+1);
    btagOptFile[i]+=".dat";

    btagOutFile_data[i]=dir+"/btag_$tag/optwg";
    //    btagOutFile_data[i]+=(i+1)*10;
    btagOutFile_data[i]+=(i+1);
    btagOutFile_data[i]+=".root";


    btagOutFile_vh[i]=dir+"/btag_$tag/signalOptwg";
    //    btagOutFile_vh[i]+=(i+1)*10;
    btagOutFile_vh[i]+=(i+1);
    btagOutFile_vh[i]+=".root";


    btagOutFile_ggh[i]=dir+"/btag_$tag/signal_ggh_Optwg";
    //    btagOutFile_ggh[i]+=(i+1)*10;
    btagOutFile_ggh[i]+=(i+1);
    btagOutFile_ggh[i]+=".root";


  }

  gROOT->ProcessLine(".L createTreeDifferentWP.C+");
  TTree* tree_data=(TTree*)_file0->Get("Data");
  TTree* tree_vh=(TTree*)_file1->Get("wzh_m125_8TeV");
   TTree* tree_ggh=(TTree*)_file1->Get("ggh_m125_8TeV");

   //make a compiled c++ program and use arrays!  
  //data
  createTreeDifferentWP t_data(tree_data);
  t_data.setOptFile(btagOptFile[$startfile]);
  t_data.setOutFile(btagOutFile_data[$startfile]);
  t_data.Loop(6);


  createTreeDifferentWP t_data2(tree_data);
  t_data2.setOptFile(btagOptFile[$startfile+1]);
  t_data2.setOutFile(btagOutFile_data[$startfile+1]);
  t_data2.Loop(6);

  createTreeDifferentWP t_data3(tree_data);
  t_data3.setOptFile(btagOptFile[$startfile+2]);
  t_data3.setOutFile(btagOutFile_data[$startfile+2]);
  t_data3.Loop(6);
 
  createTreeDifferentWP t_data4(tree_data);
  t_data4.setOptFile(btagOptFile[$startfile+3]);
  t_data4.setOutFile(btagOutFile_data[$startfile+3]);
  t_data4.Loop(6);

  createTreeDifferentWP t_data5(tree_data);
  t_data5.setOptFile(btagOptFile[$startfile+4]);
  t_data5.setOutFile(btagOutFile_data[$startfile+4]);
  t_data5.Loop(6);

  createTreeDifferentWP t_data6(tree_data);
  t_data6.setOptFile(btagOptFile[$startfile+5]);
  t_data6.setOutFile(btagOutFile_data[$startfile+5]);
  t_data6.Loop(6);

  createTreeDifferentWP t_data7(tree_data);
  t_data7.setOptFile(btagOptFile[$startfile+6]);
  t_data7.setOutFile(btagOutFile_data[$startfile+6]);
  t_data7.Loop(6);


  createTreeDifferentWP t_data8(tree_data);
  t_data8.setOptFile(btagOptFile[$startfile+7]);
  t_data8.setOutFile(btagOutFile_data[$startfile+7]);
  t_data8.Loop(6);

  createTreeDifferentWP t_data9(tree_data);
  t_data9.setOptFile(btagOptFile[$startfile+8]);
  t_data9.setOutFile(btagOutFile_data[$startfile+8]);
  t_data9.Loop(6);
 
  createTreeDifferentWP t_data10(tree_data);
  t_data10.setOptFile(btagOptFile[$startfile+9]);
  t_data10.setOutFile(btagOutFile_data[$startfile+9]);
  t_data10.Loop(6);



  //vh
  createTreeDifferentWP t_vh(tree_vh);
  t_vh.setOptFile(btagOptFile[$startfile]);
  t_vh.setOutFile(btagOutFile_vh[$startfile]);
  t_vh.Loop(6);

  createTreeDifferentWP t_vh2(tree_vh);
  t_vh2.setOptFile(btagOptFile[$startfile+1]);
  t_vh2.setOutFile(btagOutFile_vh[$startfile+1]);
  t_vh2.Loop(6);

  createTreeDifferentWP t_vh3(tree_vh);
  t_vh3.setOptFile(btagOptFile[$startfile+2]);
  t_vh3.setOutFile(btagOutFile_vh[$startfile+2]);
  t_vh3.Loop(6);
 
  createTreeDifferentWP t_vh4(tree_vh);
  t_vh4.setOptFile(btagOptFile[$startfile+3]);
  t_vh4.setOutFile(btagOutFile_vh[$startfile+3]);
  t_vh4.Loop(6);

  createTreeDifferentWP t_vh5(tree_vh);
  t_vh5.setOptFile(btagOptFile[$startfile+4]);
  t_vh5.setOutFile(btagOutFile_vh[$startfile+4]);
  t_vh5.Loop(6);

  createTreeDifferentWP t_vh6(tree_vh);
  t_vh6.setOptFile(btagOptFile[$startfile+5]);
  t_vh6.setOutFile(btagOutFile_vh[$startfile+5]);
  t_vh6.Loop(6);

  createTreeDifferentWP t_vh7(tree_vh);
  t_vh7.setOptFile(btagOptFile[$startfile+6]);
  t_vh7.setOutFile(btagOutFile_vh[$startfile+6]);
  t_vh7.Loop(6);

  createTreeDifferentWP t_vh8(tree_vh);
  t_vh8.setOptFile(btagOptFile[$startfile+7]);
  t_vh8.setOutFile(btagOutFile_vh[$startfile+7]);
  t_vh8.Loop(6);

  createTreeDifferentWP t_vh9(tree_vh);
  t_vh9.setOptFile(btagOptFile[$startfile+8]);
  t_vh9.setOutFile(btagOutFile_vh[$startfile+8]);
  t_vh9.Loop(6);

  createTreeDifferentWP t_vh10(tree_vh);
  t_vh10.setOptFile(btagOptFile[$startfile+9]);
  t_vh10.setOutFile(btagOutFile_vh[$startfile+9]);
  t_vh10.Loop(6);


  //ggh
  createTreeDifferentWP t_ggh(tree_ggh);
  t_ggh.setOptFile(btagOptFile[$startfile]);
  t_ggh.setOutFile(btagOutFile_ggh[$startfile]);
  t_ggh.Loop(6);

  createTreeDifferentWP t_ggh2(tree_ggh);
  t_ggh2.setOptFile(btagOptFile[$startfile+1]);
  t_ggh2.setOutFile(btagOutFile_ggh[$startfile+1]);
  t_ggh2.Loop(6);

  createTreeDifferentWP t_ggh3(tree_ggh);
  t_ggh3.setOptFile(btagOptFile[$startfile+2]);
  t_ggh3.setOutFile(btagOutFile_ggh[$startfile+2]);
  t_ggh3.Loop(6);
 
  createTreeDifferentWP t_ggh4(tree_ggh);
  t_ggh4.setOptFile(btagOptFile[$startfile+3]);
  t_ggh4.setOutFile(btagOutFile_ggh[$startfile+3]);
  t_ggh4.Loop(6);

  createTreeDifferentWP t_ggh5(tree_ggh);
  t_ggh5.setOptFile(btagOptFile[$startfile+4]);
  t_ggh5.setOutFile(btagOutFile_ggh[$startfile+4]);
  t_ggh5.Loop(6);

  createTreeDifferentWP t_ggh6(tree_ggh);
  t_ggh6.setOptFile(btagOptFile[$startfile+5]);
  t_ggh6.setOutFile(btagOutFile_ggh[$startfile+5]);
  t_ggh6.Loop(6);

  createTreeDifferentWP t_ggh7(tree_ggh);
  t_ggh7.setOptFile(btagOptFile[$startfile+6]);
  t_ggh7.setOutFile(btagOutFile_ggh[$startfile+6]);
  t_ggh7.Loop(6);

  createTreeDifferentWP t_ggh8(tree_ggh);
  t_ggh8.setOptFile(btagOptFile[$startfile+7]);
  t_ggh8.setOutFile(btagOutFile_ggh[$startfile+7]);
  t_ggh8.Loop(6);

  createTreeDifferentWP t_ggh9(tree_ggh);
  t_ggh9.setOptFile(btagOptFile[$startfile+8]);
  t_ggh9.setOutFile(btagOutFile_ggh[$startfile+8]);
  t_ggh9.Loop(6);

  createTreeDifferentWP t_ggh10(tree_ggh);
  t_ggh10.setOptFile(btagOptFile[$startfile+9]);
  t_ggh10.setOutFile(btagOutFile_ggh[$startfile+9]);
  t_ggh10.Loop(6);
}
EOF

###0 tag
cat <<EOF2 >OPT/notag_$tag/createTree$i.C
{
    TString dir="OPT";
    TString notagOptFile[100];
  TString notagOutFile_data[100];
  TString notagOutFile_vh[100];
  TString notagOutFile_ggh[100];

  for (int i=$startfile;i<$endfile;i++) {

    notagOptFile[i]=dir+"/notag_$tag/opt";
    //    notagptFile[i]+=(i+1)*10;
    notagOptFile[i]+=(i+1);
    notagOptFile[i]+=".dat";

    notagOutFile_data[i]=dir+"/notag_$tag/optwg";
    //    notagOutFile_data[i]+=(i+1)*10;
    notagOutFile_data[i]+=(i+1);
    notagOutFile_data[i]+=".root";


    notagOutFile_vh[i]=dir+"/notag_$tag/signalOptwg";
    //    notagOutFile_vh[i]+=(i+1)*10;
    notagOutFile_vh[i]+=(i+1);
    notagOutFile_vh[i]+=".root";


    notagOutFile_ggh[i]=dir+"/notag_$tag/signal_ggh_Optwg";
    //    notagOutFile_ggh[i]+=(i+1)*10;
    notagOutFile_ggh[i]+=(i+1);
    notagOutFile_ggh[i]+=".root";


  }

  gROOT->ProcessLine(".L createTreeDifferentWP.C+");
  TTree* tree_data=(TTree*)_file0->Get("Data");
  TTree* tree_vh=(TTree*)_file1->Get("wzh_m125_8TeV");
   TTree* tree_ggh=(TTree*)_file1->Get("ggh_m125_8TeV");

   //make a compiled c++ program and use arrays!  
  //data
  createTreeDifferentWP t_data(tree_data);
  t_data.setOptFile(notagOptFile[$startfile]);
  t_data.setOutFile(notagOutFile_data[$startfile]);
  t_data.Loop(7);


  createTreeDifferentWP t_data2(tree_data);
  t_data2.setOptFile(notagOptFile[$startfile+1]);
  t_data2.setOutFile(notagOutFile_data[$startfile+1]);
  t_data2.Loop(7);

  createTreeDifferentWP t_data3(tree_data);
  t_data3.setOptFile(notagOptFile[$startfile+2]);
  t_data3.setOutFile(notagOutFile_data[$startfile+2]);
  t_data3.Loop(7);
 
  createTreeDifferentWP t_data4(tree_data);
  t_data4.setOptFile(notagOptFile[$startfile+3]);
  t_data4.setOutFile(notagOutFile_data[$startfile+3]);
  t_data4.Loop(7);

  createTreeDifferentWP t_data5(tree_data);
  t_data5.setOptFile(notagOptFile[$startfile+4]);
  t_data5.setOutFile(notagOutFile_data[$startfile+4]);
  t_data5.Loop(7);

  createTreeDifferentWP t_data6(tree_data);
  t_data6.setOptFile(notagOptFile[$startfile+5]);
  t_data6.setOutFile(notagOutFile_data[$startfile+5]);
  t_data6.Loop(7);

  createTreeDifferentWP t_data7(tree_data);
  t_data7.setOptFile(notagOptFile[$startfile+6]);
  t_data7.setOutFile(notagOutFile_data[$startfile+6]);
  t_data7.Loop(7);


  createTreeDifferentWP t_data8(tree_data);
  t_data8.setOptFile(notagOptFile[$startfile+7]);
  t_data8.setOutFile(notagOutFile_data[$startfile+7]);
  t_data8.Loop(7);

  createTreeDifferentWP t_data9(tree_data);
  t_data9.setOptFile(notagOptFile[$startfile+8]);
  t_data9.setOutFile(notagOutFile_data[$startfile+8]);
  t_data9.Loop(7);
 
  createTreeDifferentWP t_data10(tree_data);
  t_data10.setOptFile(notagOptFile[$startfile+9]);
  t_data10.setOutFile(notagOutFile_data[$startfile+9]);
  t_data10.Loop(7);



  //vh
  createTreeDifferentWP t_vh(tree_vh);
  t_vh.setOptFile(notagOptFile[$startfile]);
  t_vh.setOutFile(notagOutFile_vh[$startfile]);
  t_vh.Loop(7);

  createTreeDifferentWP t_vh2(tree_vh);
  t_vh2.setOptFile(notagOptFile[$startfile+1]);
  t_vh2.setOutFile(notagOutFile_vh[$startfile+1]);
  t_vh2.Loop(7);

  createTreeDifferentWP t_vh3(tree_vh);
  t_vh3.setOptFile(notagOptFile[$startfile+2]);
  t_vh3.setOutFile(notagOutFile_vh[$startfile+2]);
  t_vh3.Loop(7);
 
  createTreeDifferentWP t_vh4(tree_vh);
  t_vh4.setOptFile(notagOptFile[$startfile+3]);
  t_vh4.setOutFile(notagOutFile_vh[$startfile+3]);
  t_vh4.Loop(7);

  createTreeDifferentWP t_vh5(tree_vh);
  t_vh5.setOptFile(notagOptFile[$startfile+4]);
  t_vh5.setOutFile(notagOutFile_vh[$startfile+4]);
  t_vh5.Loop(7);

  createTreeDifferentWP t_vh6(tree_vh);
  t_vh6.setOptFile(notagOptFile[$startfile+5]);
  t_vh6.setOutFile(notagOutFile_vh[$startfile+5]);
  t_vh6.Loop(7);

  createTreeDifferentWP t_vh7(tree_vh);
  t_vh7.setOptFile(notagOptFile[$startfile+6]);
  t_vh7.setOutFile(notagOutFile_vh[$startfile+6]);
  t_vh7.Loop(7);

  createTreeDifferentWP t_vh8(tree_vh);
  t_vh8.setOptFile(notagOptFile[$startfile+7]);
  t_vh8.setOutFile(notagOutFile_vh[$startfile+7]);
  t_vh8.Loop(7);

  createTreeDifferentWP t_vh9(tree_vh);
  t_vh9.setOptFile(notagOptFile[$startfile+8]);
  t_vh9.setOutFile(notagOutFile_vh[$startfile+8]);
  t_vh9.Loop(7);

  createTreeDifferentWP t_vh10(tree_vh);
  t_vh10.setOptFile(notagOptFile[$startfile+9]);
  t_vh10.setOutFile(notagOutFile_vh[$startfile+9]);
  t_vh10.Loop(7);


  //ggh
  createTreeDifferentWP t_ggh(tree_ggh);
  t_ggh.setOptFile(notagOptFile[$startfile]);
  t_ggh.setOutFile(notagOutFile_ggh[$startfile]);
  t_ggh.Loop(7);

  createTreeDifferentWP t_ggh2(tree_ggh);
  t_ggh2.setOptFile(notagOptFile[$startfile+1]);
  t_ggh2.setOutFile(notagOutFile_ggh[$startfile+1]);
  t_ggh2.Loop(7);

  createTreeDifferentWP t_ggh3(tree_ggh);
  t_ggh3.setOptFile(notagOptFile[$startfile+2]);
  t_ggh3.setOutFile(notagOutFile_ggh[$startfile+2]);
  t_ggh3.Loop(7);
 
  createTreeDifferentWP t_ggh4(tree_ggh);
  t_ggh4.setOptFile(notagOptFile[$startfile+3]);
  t_ggh4.setOutFile(notagOutFile_ggh[$startfile+3]);
  t_ggh4.Loop(7);

  createTreeDifferentWP t_ggh5(tree_ggh);
  t_ggh5.setOptFile(notagOptFile[$startfile+4]);
  t_ggh5.setOutFile(notagOutFile_ggh[$startfile+4]);
  t_ggh5.Loop(7);

  createTreeDifferentWP t_ggh6(tree_ggh);
  t_ggh6.setOptFile(notagOptFile[$startfile+5]);
  t_ggh6.setOutFile(notagOutFile_ggh[$startfile+5]);
  t_ggh6.Loop(7);

  createTreeDifferentWP t_ggh7(tree_ggh);
  t_ggh7.setOptFile(notagOptFile[$startfile+6]);
  t_ggh7.setOutFile(notagOutFile_ggh[$startfile+6]);
  t_ggh7.Loop(7);

  createTreeDifferentWP t_ggh8(tree_ggh);
  t_ggh8.setOptFile(notagOptFile[$startfile+7]);
  t_ggh8.setOutFile(notagOutFile_ggh[$startfile+7]);
  t_ggh8.Loop(7);

  createTreeDifferentWP t_ggh9(tree_ggh);
  t_ggh9.setOptFile(notagOptFile[$startfile+8]);
  t_ggh9.setOutFile(notagOutFile_ggh[$startfile+8]);
  t_ggh9.Loop(7);

  createTreeDifferentWP t_ggh10(tree_ggh);
  t_ggh10.setOptFile(notagOptFile[$startfile+9]);
  t_ggh10.setOutFile(notagOutFile_ggh[$startfile+9]);
  t_ggh10.Loop(7);
}
EOF2






    done

#run jobs
for ii in $(seq 0 1 10)
  do
  root -b -q scriptoutput_loose_cs/histograms_CMS-HGG.root scriptoutput_loose_straight_2/histograms_CMS-HGG.root OPT/btag_$tag/createTree$ii.C
  root -b -q scriptoutput_loose_cs/histograms_CMS-HGG.root scriptoutput_loose_straight_2/histograms_CMS-HGG.root OPT/notag_$tag/createTree$ii.C
  done