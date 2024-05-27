export class Card {
    #value;

    constructor(_val){
        this.#value = _val;
    }

    get value(){ return this.#value };

}