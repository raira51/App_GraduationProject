// app/javascript/controllers/modal_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close() {
    const frame = document.getElementById("modal")
    if (frame) frame.innerHTML = ""
  }
}
