import { Card } from "../models/card.js";
//import { Memory } from "../models/memory.js";
import { Notifier } from "../patterns/notifier.js";

export class ControllerMemory extends Notifier
{
    #card;
    constructor()
    {
        super();
        this.#card = this.createCard();
    }

    createCard(){
        let newVal = Math.floor(Math.random()*0xF3) + 0x1F90c;
        let newCard = new Card(newVal);
        this.notify();
        return newCard;
    }

    get card(){return this.#card}
}