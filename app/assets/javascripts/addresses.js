document.addEventListener("DOMContentLoaded", function() {
  const countryField = document.getElementById("address_country");
  const stateField = document.getElementById("address_state");
  const cityField = document.getElementById("address_city");
  const countryFullField = document.getElementById("address_country_full");
  const stateFullField = document.getElementById("address_state_full");

  if (countryField) {
    countryField.addEventListener("change", function() {
      const country = countryField.value;
      const countryFullName = countryField.options[countryField.selectedIndex].text;
      countryFullField.value = countryFullName;

      fetch(`/addresses/states?country=${country}`)
        .then(response => response.json())
        .then(data => {
          stateField.innerHTML = '<option value="">Select a state</option>';
          for (const [code, state] of Object.entries(data.states)) {
            const option = document.createElement("option");
            option.value = code;
            option.text = state;
            stateField.appendChild(option);
          }
          stateField.disabled = false;
        });
    });

    stateField.addEventListener("change", function() {
      const country = countryField.value;
      const stateCode = stateField.value;
      const stateFullName = stateField.options[stateField.selectedIndex].text;
      stateFullField.value = stateFullName;

      fetch(`/addresses/cities?country=${country}&state=${stateCode}`)
        .then(response => response.json())
        .then(data => {
          cityField.innerHTML = '<option value="">Select a city</option>';
          data.cities.forEach(city => {
            const option = document.createElement("option");
            option.value = city;
            option.text = city;
            cityField.appendChild(option);
          });
          cityField.disabled = false;
        });
    });
  }
});
