// 多重プロット

void testGraph2(){
    const Int_t n = 20;  //配列の要素数を変数で指定するときはconstを付ける
    Double_t x1[n], y1[n], x2[n], y2[n];

    for(Int_t i = 0; i < n; i++){
        x1[i] = i * 0.1;
        x2[i] = i * 0.1;
        y1[i] = 10 * sin(x1[i] + 0.2);
        y2[i] = 10 * sin(x2[i]);
    }

    TGraph* gr1 = new TGraph(n, x1, y1);
    TGraph* gr2 = new TGraph(n, x2, y2);
    gr1->SetLineColor(4);
    gr2->SetLineColor(3);
    gr2->SetLineWidth(3);
    gr2->SetMarkerStyle(21);
    gr1->Draw("AC*");
    gr2->Draw("CP");

}

