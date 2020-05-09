void testGraph3(){
    gStyle->SetOptFit();

    TCanvas* c1 = new TCanvas("c1", "Multi Graph", 700, 500);
    c1->SetGrid();

    TMultiGraph* mg = new TMultiGraph();

    const Int_t n1 = 10;
    Double_t px1[] = {-0.1, 0.05, 0.25, 0.35, 0.5, 0.61, 0.7, 0.85, 0.89, 0.95};
    Double_t py1[] = {-1, 2.9, 5.6, 7.4, 9, 9.6, 8.7, 6.3, 4.5, 1};
    Double_t ex1[] = {.5, .1, .7, .7, .4, .4, .5, .6, .7, .8};
    Double_t ey1[] = {.8, .7, .6, .5, .4, .4, .5, .6, .7, .8};

    // エラー付きプロット
    TGraphErrors* gr1 = new TGraphErrors(n1, px1, py1, ex1, ey1);
    gr1->SetMarkerColor(kBlue);
    gr1->SetMarkerStyle(21);
    gr1->Fit("pol6", "q");
    mg->Add(gr1);

    mg->Draw("ap");

}