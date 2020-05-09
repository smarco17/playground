void testHist(){
	TH1D* hist = new TH1D("myHist", "Gaussian Histgram(#sigma=1)", 50, -5, 5);
	hist->FillRandom("gaus", 10000);
	hist->Draw();
}