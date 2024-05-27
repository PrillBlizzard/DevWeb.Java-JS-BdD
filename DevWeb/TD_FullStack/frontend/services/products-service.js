

export class ProductsService {

    static async findAll(){ 
        const response = await fetch("http://localhost:8080/products")
        if(response.status === 200){
            return await response.json();
        }
    }
}