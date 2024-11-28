const saldoElement = document.getElementById("saldo");
const jumlahInput = document.getElementById("jumlah");
const warningText = document.getElementById("warningText");
const tarikKomisiBtn = document.getElementById("tarikKomisiBtn");

// Mendapatkan nilai saldo dari elemen (konversi ke angka)
const saldo = parseInt(saldoElement.textContent.replace(/\./g, ""));

if (saldo <= 0) {
  jumlahInput.readOnly = true;
  warningText.textContent = "Saldo tidak mencukupi untuk penarikan.";
  tarikKomisiBtn.disabled = true;
}

// Fungsi untuk mengecek validasi input jumlah
jumlahInput.addEventListener("input", () => {
  const jumlah = parseInt(jumlahInput.value);
  if (jumlah > saldo) {
    warningText.textContent = "Jumlah penarikan tidak boleh melebihi saldo";
    tarikKomisiBtn.disabled = true;
  } else if (jumlah < 10000) {
    warningText.textContent = "Jumlah penarikan Minimal 10.000";
    tarikKomisiBtn.disabled = true;
  } else if (jumlah > 0) {
    warningText.textContent = "";
    tarikKomisiBtn.disabled = false;
  } else {
    warningText.textContent = "";
    tarikKomisiBtn.disabled = true;
  }
});

tarikKomisiBtn.addEventListener("click", () => {
  location.href =
    "https://gudangmaterials.id/index.php?route=affiliate/konfirmtarik";
});
