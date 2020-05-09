#include <fstream>

void testConversion(TString dirPath, TString fileName){
  TFile* file = new TFile(dirPath + fileName, "READ");
  Int_t numOfHist = file->GetNkeys();

  TString tmpDir = ".\\_tmp\\";
  TString format = ".csv";
  
  for(Int_t i = 0; i < numOfHist; i++){
      TH1D* hist = (TH1D*)file->Get(Form("%d", i+1));
      TString title = hist->GetTitle();

      Int_t entries = hist->GetEntries();
      Int_t xNBins = hist->GetXaxis()->GetNbins();
      Double_t xMin = hist->GetXaxis()->GetXmin();
      Double_t xMax = hist->GetXaxis()->GetXmax();
      const char* xUnit = hist->GetXaxis()->GetTitle();
      
      ofstream ofs(tmpDir + title + format);
      ofs << "Energy" << xUnit << "," << "Counts" << endl;
      for(Int_t j=0; j < xNBins; j++){
        ofs << j * xMax / xNBins << "," << hist->GetBinContent(j) << endl;
      }
      ofs.close();

      TCanvas* canvas = new TCanvas(Form("canvas%d", i+1), title);
      canvas->cd();
      hist->Draw("HIST");
      hist->SetXTitle(Form("Energy%s", xUnit));
      hist->SetYTitle("Count");
      hist->GetOption();
      canvas->SaveAs("./_tmp/" + title + ".jpg");
  }
}