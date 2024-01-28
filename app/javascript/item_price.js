
window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
 if (priceInput)
 {addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = inputValue * 0.1
    addTaxDom.innerHTML = Math.floor(tax).toLocaleString();

  const salesProfit = document.getElementById("profit");
    const profit = inputValue * 0.9
    salesProfit.innerHTML = Math.floor(profit).toLocaleString();
});
 }
});


