#!/bin/bash

tag=Jun25_apocalypse


mkdir "2Dbtag_"$tag
mkdir "2Dbtag_0tag_"$tag
mkdir "OPT_2Dbtag/btag_"$tag
mkdir "OPT_2Dbtag/btag_"$tag"/datacard"
mkdir "OPT_2Dbtag/notag_"$tag
mkdir "OPT_2Dbtag/notag_"$tag"/datacard"


for i in $(seq 1 1 100)
  do
#btag
  echo $i
  filename_btag="optcuts_"$tag"/cutsGA_cat2_Seff"$i".txt"
  
  ptgg_btag=`cat $filename_btag|grep ptRungg|awk '{print $2}'`
  theta_btag=`cat $filename_btag|grep absCosThetaStar|awk '{print $3}'`
  ptjet_btag=`cat $filename_btag|grep ptJet2|awk '{print $2}'`
  
  echo $ptgg_btag

  echo "2Dbtag_"$tag"/opt"$i".dat"
  
  echo "ptgg_btag_cut="$ptgg_btag >"2Dbtag_"$tag"/opt"$i".dat"
  echo "costhetastar_btag_cut="$theta_btag >>"2Dbtag_"$tag"/opt"$i".dat"
  echo "ptjet_btag_cut="$ptjet_btag >>"2Dbtag_"$tag"/opt"$i".dat"
  
  cp "2Dbtag_"$tag"/opt"$i".dat" "OPT_2Dbtag/btag_"$tag"/"
  
#notag
  filename_notag="optcuts_"$tag"/cutsGA_cat3_Seff"$i".txt"
  
  ptgg_notag=`cat $filename_notag|grep ptRungg|awk '{print $2}'`
  theta_notag=`cat $filename_notag|grep absCosThetaStar|awk '{print $3}'`
  ptjet_notag=`cat $filename_notag|grep ptJet2|awk '{print $2}'`

  echo "ptgg_0tag_cut="$ptgg_notag >"2Dbtag_0tag_"$tag"/opt"$i".dat"
  echo "costhetastar_0tag_cut="$theta_notag >>"2Dbtag_0tag_"$tag"/opt"$i".dat"
  echo "ptjet_0tag_cut="$ptjet_notag >>"2Dbtag_0tag_"$tag"/opt"$i".dat"

  cp "2Dbtag_0tag_"$tag"/opt"$i".dat" "OPT_2Dbtag/notag_"$tag"/"

done
echo $tag
ls OPT_2Dbtag/btag_$tag/opt*.dat
sed -i 's|ptgg_btag_cut=||' OPT_2Dbtag/btag_$tag/opt*.dat
sed -i 's|costhetastar_btag_cut=||' OPT_2Dbtag/btag_$tag/opt*.dat
sed -i 's|ptjet_btag_cut=||' OPT_2Dbtag/btag_$tag/opt*.dat

sed -i 's|ptgg_0tag_cut=||' OPT_2Dbtag/notag_$tag/opt*.dat
sed -i 's|costhetastar_0tag_cut=||' OPT_2Dbtag/notag_$tag/opt*.dat
sed -i 's|ptjet_0tag_cut=||' OPT_2Dbtag/notag_$tag/opt*.dat

