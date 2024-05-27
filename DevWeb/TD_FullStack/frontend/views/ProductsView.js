import { ProductsService } from "../services/products-service.js";

export class ProductsView {

    View(){

    }

    async displayProducts(){
        list = await ProductsService.findAll();
        for(i in list){
            this.#displayProduct(i);// à finir 
        } 
    }

    #displayProduct(product){
        document.querySelector("div").innerHTML() = product.name;
    }

}