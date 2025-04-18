import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static targets = ["round"]

  connect() {
    this.roundTargets.forEach((round) => {
      Sortable.create(round, {
        group: "bracket",
        animation: 150,
        onEnd: this.handleDrop.bind(this)
      })
    })
    connect() {
      console.log("✅ BracketController connected")
      ...
    }
  }

  // Used by Sortable.js drops
  handleDrop(event) {
    const droppedElement = event.item
    const teamId = droppedElement.dataset.teamId
    const matchupId = droppedElement.dataset.matchupId

    droppedElement.classList.add("team-box")
    droppedElement.classList.remove("matchup-box")

    if (!teamId || !matchupId) {
      alert("Missing team or matchup information.")
      return
    }

    this.savePrediction(teamId, matchupId)
  }

  // Used for custom drop zones (non-Sortable)
  dragOver(event) {
    event.preventDefault() // <- Required to allow drop
  }

  drop(event) {
    event.preventDefault()
    const data = JSON.parse(event.dataTransfer.getData("application/json"))
  
    if (!data.teamId || !data.matchupId) {
      alert("Missing team or matchup info.")
      return
    }
  
    // Replace innerHTML with fully interactive element
    event.target.innerHTML = `
      <div class="team-box"
           draggable="true"
           data-action="dragstart->bracket#dragStart"
           data-team-id="${data.teamId}"
           data-matchup-id="${data.matchupId}"
           data-team-name="${data.teamName}"
           data-logo-filename="${data.logo}">
        <img src="/assets/teams/${data.logo}" height="30"><br>
        ${data.teamName}
      </div>
    `
  
    this.savePrediction(data.teamId, data.matchupId)
  }
  

  savePrediction(teamId, matchupId) {
    fetch("/predictions", {
      method: "POST",
      headers: {
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({
        matchup_id: matchupId,
        predicted_winner_id: teamId,
        games_in_series: 6
      })
    })
    .then((response) => {
      if (!response.ok) {
        alert("Error saving prediction.")
      } else {
        console.log("✅ Prediction saved!")
      }
    })
    .catch(() => alert("Network error saving prediction."))
  }

  dragStart(event) {
    const el = event.target
    const data = {
      teamId: el.dataset.teamId,
      teamName: el.dataset.teamName,
      matchupId: el.dataset.matchupId,
      logo: el.dataset.logoFilename
    }
    event.dataTransfer.setData("application/json", JSON.stringify(data))
  }
  console.log("🔥 dragStart", data)

}
