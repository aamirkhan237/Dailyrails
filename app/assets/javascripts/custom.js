document.addEventListener("DOMContentLoaded", function() {
    const cards = document.querySelectorAll('.card');
    cards.forEach(card => {
      new mdb.Card(card);
    });
  });