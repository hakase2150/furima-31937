function count () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const countVal = Math.floor(itemPrice.value * 0.1);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${countVal}`;
    const salesProfit = itemPrice.value - countVal;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${salesProfit}`
  });
}

window.addEventListener('load', count);
