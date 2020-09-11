import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "subtotal", "total" ]

  totalize () {
    let total = 0.00;
    this.subtotalTargets.forEach(subtotal =>  total += parseFloat(subtotal.innerText));
    this.totalTarget.innerText = parseFloat(total).toFixed(2)
  }
}
