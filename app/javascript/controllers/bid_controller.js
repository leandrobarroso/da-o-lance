import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "total" ]

  connect () {
    console.log(this.targets)
  }
}
