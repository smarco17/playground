import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { FormBuilder, Validators } from '@angular/forms';

import { Product } from '../../shared/models/product';
import { ProductService } from '../../shared/services/product.service';

@Component({
  selector: 'app-product-edit',
  templateUrl: './product-edit.component.html',
  styleUrls: ['./product-edit.component.scss']
})
export class ProductEditComponent implements OnInit {
  productForm = this.fb.group({
    id: [''],
    name: [''],
    price: ['', Validators.compose([Validators.min(100), Validators.max(10000000)])],
    description: [''],
  });

  constructor(
    private router: Router,
    private route : ActivatedRoute,
    private fb: FormBuilder,
    private productService: ProductService,
  ) { }

  get name() { return this.productForm.get('name'); }
  get price() { return this.productForm.get('price'); }

  ngOnInit(): void {
    this.route.params.subscribe((params: Params) => {
      this.productService.get(params['id']).subscribe((product: Product) => {
        this.productForm.setValue({
          id: product.id,
          name: product.name,
          price: product.price,
          description: product.description,
        });
      });
    });
  }
  saveProduct(): void {
    if(this.productForm.valid){
      const {id, name, price, description } = this.productForm.getRawValue();
      this.productService.update(new Product(id, name, price, description));
      this.router.navigate(['/products', this.productForm.controls.id.value]);
    }
  }
}
