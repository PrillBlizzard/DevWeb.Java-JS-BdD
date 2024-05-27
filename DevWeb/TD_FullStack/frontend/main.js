
import { ProductsView } from "./views/ProductsView.js";

async function run(){
    
    ProductsView.displayProducts();
}

window.addEventListener("load", run )
