function generateFields(){
    const tileCont = document.querySelector("field-parts");
    for(let i=0; i < 25; ++i){
        const tile = document.createElement("field-part");
        tile.classList.add("grass");
        tileCont.appendChild(tile);
        
        tile.addEventListener("click",()=>{
            let activeTool = document.querySelector("tool.active")
            if(activeTool.id == "tool-hoe"){
                labourer(tile);
            }
            else if(activeTool.id == "tool-water"){
                arroser(tile);
            }
            else if(activeTool.id == "tool-sow"){
                semer(tile);
            }
            else if(activeTool.id == "tool-harvest"){
                moissonner(tile);
            }
        })
    }
}

function attachToolsEvent(){
    const tools = document.querySelectorAll("tool");
    tools.forEach((tool)=>{
        tool.addEventListener("click", ()=>{
            tools.forEach((tool2)=>(
                tool2.classList.remove("active")
            ))
            tool.classList.add("active");
        } );
    })
}


function labourer(_tile){
    if(_tile.classList.contains("grass")){
        _tile.classList.remove("grass");
        _tile.classList.add("farmland");
    }
}
function arroser(_tile){
    if(_tile.classList.contains("farmland")){
        _tile.classList.add("hydrated");
        _tile.dataset.waterLevel = 10;
    }
}
function semer(_tile){
    if(_tile.classList.contains("farmland")){
        _tile.dataset.seed = 1;
    }
}
function moissonner(_tile){
    if(_tile.classList.contains("farmland")){
        if(_tile.dataset.seed == 7){
            const stockBlé = document.querySelector("stock")
            stockBlé.innerHTML = parseInt(stockBlé.innerHTML)  + 1;
            _tile.dataset.seed =  0;
        }
        else{
            _tile.dataset.seed = 0;
        }
    }
}

function grow(){
    const champs = document.querySelectorAll("field-part");
    champs.forEach((champ)=> {
        if(champ.classList.contains("farmland")){
            if(champ.classList.contains("hydrated")){
                const randNum = Math.random()*100;
                if(randNum < 30){
                    if((parseInt(champ.dataset.seed) > 0) && (parseInt(champ.dataset.seed) < 7)){
                        champ.dataset.seed = parseInt(champ.dataset.seed) + 1;
                    }
                }
            }
            else{
                const randNum = Math.random()*100;
                if(randNum < 5){
                    if((parseInt(champ.dataset.seed) > 0) && (parseInt(champ.dataset.seed) < 7)){
                        champ.dataset.seed = parseInt(champ.dataset.seed) + 1;
                    }
                }
            }
            
            if(champ.dataset.water > 0){
                champ.dataset.waterLevel = parseInt(champ.dataset.waterLevel) - 1;
            } // à finir !
            
        }
        
    } );
    setTimeout(grow, 1000);
}


window.addEventListener("load", generateFields );
window.addEventListener("load", attachToolsEvent );
window.addEventListener("load", grow );
