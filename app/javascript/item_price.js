function Price() {
  const priceInput = document.getElementById("item-price");
 if (priceInput)
 {addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = inputValue * 0.1
    const floorTax = Math.floor(tax)
    addTaxDom.innerHTML = floorTax.toLocaleString();

  const salesProfit = document.getElementById("profit");
    const profit = inputValue - floorTax
    salesProfit.innerHTML = profit.toLocaleString();
  });
 }
}

window.addEventListener('turbo:load', () => {
  addEventListener("input", Price);
});

window.addEventListener('turbo:render', () => {
  addEventListener("input", Price);
});
