import { Observer } from "../patterns/observer.js";

export class ViewMemory extends Observer
{
    #controllerMemory;

    constructor(controllerMemory)
    {
        super();

        this.#controllerMemory = controllerMemory;
        this.#controllerMemory.addObserver(this);
    }

    displayCard(){
        let val = this.#controllerMemory.card.value
        const cardHTML = document.createElement("div");
        cardHTML.classList.add("card");
        cardHTML.innerHTML = "&#x" + val.toString(16);
        let cardPlace = document.querySelector(".cards");
        cardHTML.addEventListener("click",()=>{this.notify()})
        cardPlace.append(cardHTML);


    }

    notify()
    {
        this.displayCard();
    }
}