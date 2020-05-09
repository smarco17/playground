// 簡単なプロット
void testGraph1(){
    const Int_t n = 20;
    Double_t x[n], y[n];

    for(Int_t i = 0; i < n; i++){
        x[i] = i * 0.1;
        y[i] = 10 * sin(x[i] + 0.2);
    }

    TGraph* gr1 = new TGraph(n, x, y);
    gr1->Draw("AC*"); // AC* - マーカー付き曲線, AL - 曲線, AB - ヒストグラム
}
