import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import { French } from "flatpickr/dist/l10n/fr.js";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startInput", "endInput"];

  connect() {
    this.fp = flatpickr(this.startInputTarget, {
      mode: "range",
      locale: "french",

      dateFormat: "j F Y",
      minDate: "today",
      monthSelectorType: "short",
      onChange: this.handleDateChange.bind(this),
      onReady: this.handleCalendarReady.bind(this),

    });
  }
  handleDateChange(selectedDates) {
    if (selectedDates.length === 2) {
      this.startInputTarget.value = selectedDates[0].toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' });
      this.endInputTarget.value = selectedDates[1].toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' });
    }
    this.customizeStyles(); // Apply custom styles on date change
  }

  handleCalendarReady(selectedDates, dateStr, instance) {
    this.setInitialDates(selectedDates);
    this.customizeStyles();
  }

  setInitialDates(selectedDates) {
    if (selectedDates.length === 2) {
      this.startInputTarget.value = selectedDates[0].toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' });
      this.endInputTarget.value = selectedDates[1].toLocaleDateString('fr-FR', { day: 'numeric', month: 'long', year: 'numeric' });
    }
  }

  customizeStyles() {
    if (!this.fp || !this.fp.calendarContainer) return;

    const selectedDays = this.fp.calendarContainer.querySelectorAll(".flatpickr-day.selected, .flatpickr-day.startRange, .flatpickr-day.endRange");
    selectedDays.forEach((dayElem) => {
      dayElem.style.backgroundColor = "#a3d2ae"; // Couleur de fond
      dayElem.style.borderColor = "#7dc0a3";     // Couleur de bordure
      dayElem.style.color = "a3d2ae";             // Couleur du texte
    });
  }
}
