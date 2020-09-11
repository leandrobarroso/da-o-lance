import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "quantity", "unitprice", "subtotal", "total" ]

  totalize() {
    let subTotal = (parseFloat(this.quantityTarget.textContent) * parseFloat(this.unitpriceTarget.value)).toFixed(2)
    if (isNaN(subTotal)){
      subTotal = 0;
      this.subtotalTarget.textContent = subTotal.toFixed(2);
    } else {
      this.subtotalTarget.textContent = subTotal;
    }
  }
}
