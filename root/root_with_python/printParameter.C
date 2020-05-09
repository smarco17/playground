#include <iostream>

void printParameter(){
    const char numList[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};

    // ROOTファイルを開く
    TFile* file = new TFile("proton.root", "READ");
    // ヒストグラムの数を取得
    Int_t numOfHist = file->GetNkeys();
    cout << "Number of Histgram : " << numOfHist << endl;

    Int_t thCount = 0;
    Int_t lowTotalCount = 0;
    Int_t rangeLow = 20;
    Int_t i = 0;
    Int_t n = 0;
    while(i < numOfHist*2){
        if(numList[i] != '\0'){
            n++;
            TH1D* hist = (TH1D*)file->Get(&numList[i]);
            Int_t xNBins = hist->GetXaxis()->GetNbins();
            Double_t xMin = hist->GetXaxis()->GetXmin();
            Double_t xMax = hist->GetXaxis()->GetXmax();
            Double_t xCMean = hist->GetMean(1);
            Double_t yCMean = hist->GetMean(2);
            char* xUnit = hist->GetXaxis()->GetTitle();

            cout << n << "-->----------Info----------" << endl;
            cout << "Title : " << hist->GetTitle() << endl;
            cout << "Entries : " << hist->GetEntries() << endl;
            cout << "Number of x bins : " << xNBins << endl;
            cout << "X mean : " << xCMean << endl;
            cout << "Y mean : " << yCMean << endl;
            cout << "" << endl;

            for(Int_t j=0; j < xNBins; j++){
                if(hist->GetBinContent(j) > thCount){
                    // cout << "x : " << hist->GetBinCenter(j) << endl;
                    cout << "******************************" << endl;
                    cout << "Bin : " << j << " -> " 
                         << "Energy : " << xMax / xNBins * j << xUnit << endl;
                    cout << "Count : " << hist->GetBinContent(j) 
                         << " +- " << hist->GetBinError(j) << endl;
                }
                if(j < rangeLow){
                    lowTotalCount += hist->GetBinContent(j);
                }
            }
            cout << "Total count in low energy : " << lowTotalCount << endl; 
            cout << "" << endl;
        }
        i++;
    }
    cout << "done!" << endl;
}