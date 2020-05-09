import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';

import { Product } from '../models/product';

@Injectable({
  providedIn: 'root'
})

export class ProductService {
  TOKEN = 'eyJhbGciOiJSUzI1NiIsImtpZCI6Ijg4ODQ4YjVhZmYyZDUyMDEzMzFhNTQ3ZDE5MDZlNWFhZGY2NTEzYzgiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vYW5ndWxhcnByYWN0aWNlLTkzNDhjIiwiYXVkIjoiYW5ndWxhcnByYWN0aWNlLTkzNDhjIiwiYXV0aF90aW1lIjoxNTg4NDY4MTI0LCJ1c2VyX2lkIjoia282RTk5MTFVSWNkNGNnTlgyWjEwRExScGtuMSIsInN1YiI6ImtvNkU5OTExVUljZDRjZ05YMloxMERMUnBrbjEiLCJpYXQiOjE1ODg0NjgxMjQsImV4cCI6MTU4ODQ3MTcyNCwiZW1haWwiOiJza3NraHJAb3V0bG9vay5qcCIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJza3NraHJAb3V0bG9vay5qcCJdfSwic2lnbl9pbl9wcm92aWRlciI6InBhc3N3b3JkIn19.EXi-m6LyK6p1n8AIY0yhCD2hSrf4lrbAtRVYF2TbJKGWW1I9EJoBm2n_cfRbRN8_bqA-8bCzBpU5dnjf7bleVkHdp2xITNpEkc0rpI6Hk7pcXhXpi06UdHsvh5ddexzqvxIZ-29yzwlys6IKt0SJXvi74jlNjdst-3XKU2-CQHlPLKkCMq2le0wsigTUPAoG7GIYBugmerT4OD3ERPMjRfk8vVGNYYlH7I3yY5bQekGGPG_3zUkmqpWnScrrbi1qH6Dq0WUGRv8ivPZQoJHls_J1_PKoinQHzsoMUUBUgGSm7ns7VUGDvxxSZukwhEHZhRJSqu4OoJXe7026CugLxw';

  products = [
    new Product(1, 'Angular入門書「天地創造の章」', 3800, '神は云った。「Angularあれ」。するとAngularが出来た。'),
    new Product(2, 'Angularを覚えたら、年収も上がって、女の子にももてて、人生が変わりました！', 410, '年収300万のSEが、Angularと出会う。それは、小さな会社の社畜が始めた、最初の抵抗だった。'),
    new Product(3, '異世界転生から始めるAngular生活(1)', 680,
      'スパゲッティの沼でデスマーチ真っ最中の田中。過酷な日々からの現実逃避か彼は、異世界に放り出され、そこでAngularの入門書を拾う。現実逃避でさえ、プログラミングをするしかない彼に待ち受けるのは！？'),
  ];

  constructor(
    private http: HttpClient,
  ) { }

  list(): Observable<Product[]>{
    return of(this.products);
  }

  get(id: number): Observable<Product> {
    return of(this.products[id - 1]);
  }

  update(product: Product): void {
    const index = this.products.findIndex( (prd: Product) => prd.id === product.id );
    this.products[index] = product;
  }
}
