// AND Gate
document.getElementById("inputA").addEventListener("change", updateAND);
document.getElementById("inputB").addEventListener("change", updateAND);

function updateAND() {
  let a = document.getElementById("inputA").checked ? 1 : 0;
  let b = document.getElementById("inputB").checked ? 1 : 0;

  // Label update
  document.querySelector("#inputA + .switch-label").textContent = a ? "ON" : "OFF";
  document.querySelector("#inputB + .switch-label").textContent = b ? "ON" : "OFF";

  // Output update
  document.getElementById("output").textContent = (a && b) ? 1 : 0;
}

// OR Gate
document.getElementById("orInputA").addEventListener("change", updateOR);
document.getElementById("orInputB").addEventListener("change", updateOR);

function updateOR() {
  let a = document.getElementById("orInputA").checked ? 1 : 0;
  let b = document.getElementById("orInputB").checked ? 1 : 0;
  document.querySelector("#orInputA + .switch-label").textContent = a ? "ON" : "OFF";
  document.querySelector("#orInputB + .switch-label").textContent = b ? "ON" : "OFF";
  document.getElementById("orOutput").textContent = (a || b) ? 1 : 0;
}

// NOT Gate
document.getElementById("notInput").addEventListener("change", updateNOT);

function updateNOT() {
  let a = document.getElementById("notInput").checked ? 1 : 0;
  document.querySelector("#notInput + .switch-label").textContent = a ? "ON" : "OFF";
  document.getElementById("notOutput").textContent = a ? 0 : 1;
}
