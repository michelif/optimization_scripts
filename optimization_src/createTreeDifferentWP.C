#define createTreeDifferentWP_cxx
#include "createTreeDifferentWP.h"
#include <TH2.h>
#include <TStyle.h>
#include <TCanvas.h>
#include "TFile.h"
#include "TTree.h"
#include <TChain.h>
#include "TBrowser.h"
#include "TH2.h"
#include "TRandom.h"
#include "TStyle.h"
#include "TCanvas.h"
#include "TLine.h"
#include "TF1.h"
#include "TH1.h"
#include "THStack.h"
#include "TVector3.h"
#include "TGraph.h"
#include "TGraphErrors.h"
#include "TTreeIndex.h"
#include "TChainIndex.h"
#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <vector>
#include <time.h>
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <iostream>
#include <fstream>

void createTreeDifferentWP::Loop(int category_used)
{
//   In a ROOT session, you can do:
//      Root > .L createTreeDifferentWP.C
//      Root > createTreeDifferentWP t
//      Root > t.GetEntry(12); // Fill t data members with entry number 12
//      Root > t.Show();       // Show values of entry 12
//      Root > t.Show(16);     // Read and show values of entry 16
//      Root > t.Loop();       // Loop on all entries
//

//     This is the loop skeleton where:
//    jentry is the global entry number in the chain
//    ientry is the entry number in the current Tree
//  Note that the argument to GetEntry must be:
//    jentry for TChain::GetEntry
//    ientry for TTree::GetEntry and TBranch::GetEntry
//
//       To read only selected branches, Insert statements like:
// METHOD1:
//    fChain->SetBranchStatus("*",0);  // disable all branches
//    fChain->SetBranchStatus("branchname",1);  // activate branchname
// METHOD2: replace line
//    fChain->GetEntry(jentry);       //read all branches
//by  b_branchname->GetEntry(ientry); //read only this branch
   if (fChain == 0) return;
   cout<<"starting"<<endl;

   //pt and eta weight files
   //   std::string ptweight2DFileName_data="scales_2D_pt_data_4GeVbinning.root";
   //   std::string etaweight2DFileName_data="scales_2D_eta_data_01binning.root";

   std::string ptweight2DFileName_data="weight_giuseppe/scales_2D_pt_data_moriond.root";
   std::string etaweight2DFileName_data="weight_giuseppe/scales_2D_eta_data_moriond.root";

   TFile* ptweight2DFile_data=TFile::Open(ptweight2DFileName_data.c_str());
   TFile* etaweight2DFile_data=TFile::Open(etaweight2DFileName_data.c_str()); 

   TH2F* h2_ptweight_data=(TH2F*)ptweight2DFile_data->Get("h2D_pt_data");
   TH2F* h2_etaweight_data=(TH2F*)etaweight2DFile_data->Get("h2D_eta_data");

   std::ifstream optFile(optFileName, std::ios::in);
   if (!optFile.is_open()) {
     std::cout<<"file not found"<<std::endl;
     exit(0);
   }

   cout<<"reading optFile"<<endl;

   float ptgg_cut,cosThetaStar_cut,ptjet_cut;

   while(!optFile.eof()) {
     optFile>>ptgg_cut>>cosThetaStar_cut>>ptjet_cut;
   }

   cout<<ptgg_cut<<" "<<cosThetaStar_cut<<" "<<ptjet_cut<<endl;

   TFile* outFile=TFile::Open(outFileName,"recreate");
   TTree* tree_passedEvents= new TTree();
   tree_passedEvents->SetName("tree_passedEvents");
   createBranches(tree_passedEvents);

   Long64_t nentries = fChain->GetEntriesFast();

   Long64_t nbytes = 0, nb = 0;
   bool isMC=false;
   if(TString(fChain->GetName()) == "wzh_m125_8TeV"||TString(fChain->GetName()) == "ggh_m125_8TeV")isMC=true;
   for (Long64_t jentry=0; jentry<nentries;jentry++) {
      Long64_t ientry = LoadTree(jentry);
      if (ientry < 0) break;
      nb = fChain->GetEntry(jentry);   nbytes += nb;
      // if (Cut(ientry) < 0) continue;
      if(jentry%10000==0)cout<<jentry<<endl;
      if(cosThetaStar>cosThetaStar_cut || dipho_pt<ptgg_cut || j1_pt<ptjet_cut ||j2_pt<ptjet_cut) continue;
      //reweighting for cs
      if(!isMC){
	double ptweight2D_data=h2_ptweight_data->GetBinContent(h2_ptweight_data->GetXaxis()->FindBin(ph2_pt),h2_ptweight_data->GetYaxis()->FindBin(ph1_pt));
	double etaweight2D_data=h2_etaweight_data->GetBinContent(h2_etaweight_data->GetXaxis()->FindBin(ph2_eta),h2_etaweight_data->GetYaxis()->FindBin(ph1_eta));
	//evweight should be 1 for data, but ok, keep it
	if(ptweight2D_data*etaweight2D_data<5.){//skip few big weights in pt due to low stat
	  pt_scaled_2D_weight_data_t=evweight*ptweight2D_data;
	  eta_scaled_2D_weight_data_t=evweight*etaweight2D_data;
	  pt_eta_scaled_2D_weight_data_t=evweight*ptweight2D_data*etaweight2D_data;
	}else{
	  pt_scaled_2D_weight_data_t=evweight;
	  eta_scaled_2D_weight_data_t=evweight;
	  pt_eta_scaled_2D_weight_data_t=evweight;
	}
      }

      //keep all categories for data to estimate cs/ss with inclusive selection
      if(isMC){
	if(category!=category_used)continue;
      }


      tree_passedEvents->Fill();
   }
   tree_passedEvents->Write();
   outFile->Write();
   outFile->Close();
}
