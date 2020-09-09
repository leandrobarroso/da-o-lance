import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "quantity", "unitprice", "subtotal", "total" ]

  totalize() {
    this.subtotalTarget.textContent = parseInt(this.quantityTarget.textContent, 10) * this.unitpriceTarget.value
  }
}
