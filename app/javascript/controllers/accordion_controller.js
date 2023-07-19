import { Controller } from "@hotwired/stimulus"
import Velocity from 'velocity-animate';

export default class extends Controller {
    static targets = ['content', 'arrow']

    connect() {
        this.expanded = false
    }

    toggle() {
        if(this.expanded) {
            Velocity( this.contentTarget, "slideUp", { duration: 500, visibility: 'hidden'})
            this.expanded = false
            this.arrowTarget.classList.remove("transform", "rotate-90")
        }
        else {
            Velocity( this.contentTarget, "slideDown", { duration: 500, visibility: 'visible'})
            this.expanded = true
            this.arrowTarget.classList.add("transform", "rotate-90")
        }
    }
}
