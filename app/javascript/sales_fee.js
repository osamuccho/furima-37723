window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
 //  console.log(priceInput)
   priceInput.addEventListener("input", () => {
     const addTaxDom = document.getElementById("sales-fee");
     // console.log(priceInput.innerHTML);
     addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
     const addPofitDom = document.getElementById("profit");
     // console.log(priceInput.innerHTML);
     addPofitDom.innerHTML = Math.floor(priceInput.value - Math.round(priceInput.value * 0.1 ))
 })
});