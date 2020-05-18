import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';

import { Product } from '../models/product';

@Injectable({
  providedIn: 'root'
})

export class ProductService {
  BASE_URL = 'https://angularpractice-9348c.firebaseio.com';
  UID = 'ko6E9911UIcd4cgNX2Z10DLRpkn1';
  TOKEN = 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImZjMmM4YmIyNmE3OGM0M2JkODYzNzA1YjNkNzkyMWI0ZTY0MjVkNTQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYW5ndWxhcnByYWN0aWNlLTkzNDhjIiwiYXVkIjoiYW5ndWxhcnByYWN0aWNlLTkzNDhjIiwiYXV0aF90aW1lIjoxNTg5MTExMjU3LCJ1c2VyX2lkIjoia282RTk5MTFVSWNkNGNnTlgyWjEwRExScGtuMSIsInN1YiI6ImtvNkU5OTExVUljZDRjZ05YMloxMERMUnBrbjEiLCJpYXQiOjE1ODkxMTEyNTcsImV4cCI6MTU4OTExNDg1NywiZW1haWwiOiJza3NraHJAb3V0bG9vay5qcCIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJza3NraHJAb3V0bG9vay5qcCJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.T1NMSUAiHltpV4VMoGti0oQvHNxx-xot2ILE_L49TqLRuB62gw5MZ5xxfhbLvIA4HzyS0_6o7BrTSM5hDNq1_yiF_RnZfhGC2d4LUHdCPRcKTVqonFPOIzrLm0p0MSL99w2dxmBhQGzw949we-WviDoXk8pHINqCGJHqYEWVvAhYCd9gGO9MuYXaMC3kGC_hNN6kRyCn2t5QUtONfUhij7q75b1at_iT1vdHR_xDsy-PVP5oAnDbh6rMfnMgO86zrOXxVdSJre4h2jmqILvDk7VxGOYnQgd8IpMES8XdCsnwNTEbqnS885LA-88Oamw2S3dN1dNmTl70ALvEyFw6ow';

  products = [
    new Product(1, 'Angular入門書「天地創造の章」', 3800, '神は云った。「Angularあれ」。するとAngularが出来た。'),
    new Product(2, 'Angularを覚えたら、年収も上がって、女の子にももてて、人生が変わりました！', 410, '年収300万のSEが、Angularと出会う。それは、小さな会社の社畜が始めた、最初の抵抗だった。'),
    new Product(3, '異世界転生から始めるAngular生活(1)', 680,
      'スパゲッティの沼でデスマーチ真っ最中の田中。過酷な日々からの現実逃避か彼は、異世界に放り出され、そこでAngularの入門書を拾う。現実逃避でさえ、プログラミングをするしかない彼に待ち受けるのは！？'),
  ];

  constructor(
    private http: HttpClient,
  ) { }

  list(): Observable<Product[]> {
    return this.http.get(`${this.BASE_URL}/users/${this.UID}/product.json`, { params: { auth: this.TOKEN } }).pipe(
      map((response: any) => {
        if (response){
          return Object.keys(response).map((key: string) => {
            const prd = response[key];
            return new Product(key, prd.name, prd.price, prd.description);
          })
        } else {
          return [];
        }
      })
    );
  }

  create(product: Product): Observable<void>{
    return this.http.post(`${this.BASE_URL}/users/${this.UID}/product.json`, product, { params: { auth: this.TOKEN } }).pipe(
      map((response: any) => product.key = response.name),
    );
  }

  get(key: string): Observable<Product> {
    return this.http.get(`${this.BASE_URL}/users/${this.UID}/product/${key}.json`, { params: { auth: this.TOKEN }}).pipe(
      map((response: any) => {
        return new Product(key, response.name, response.price, response.description);
      })
    );
  }

  update(product: Product): void {
    const index = this.products.findIndex( (prd: Product) => prd.key === product.key);
    this.products[index] = product;
  }
}
