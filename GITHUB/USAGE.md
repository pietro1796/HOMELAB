# 📘 ESPHome Config – Gestione con Git + GitHub

Questo repository contiene i file di configurazione ESPHome usati in locale e sincronizzati con GitHub. Di seguito trovi il flusso di lavoro completo per la gestione.

---

## 📦 Primo import (inizializzazione repository locale)

```bash
cd esphome/config/
nano .gitignore              # Aggiungi file/cartelle da ignorare (opzionale)

git init
git remote add origin https://github.com/pietro1796/esphome-config.git
git add .
git commit -m "Import massivo"
git push -u origin master
```

---

## 🔄 Sincronizzazione con GitHub

### 🔽 Scaricare modifiche fatte su GitHub (es. modifiche via web)

```bash
git pull origin master
```

Per controllare cosa è cambiato prima di unire:

```bash
git fetch origin
git diff origin/master
git merge origin/master
```

---

## ✏️ Modifiche locali → GitHub

1. Modifica i file localmente (es: `packages/common.yaml`)
2. Esegui:

```bash
git status                          # Controlla file modificati
git add packages/common.yaml        # Aggiungi file modificato (o `.` per tutti)
git commit -m "modifica locale"
git push origin master
```

---

## 🛠 Suggerimenti

### `.gitignore` di esempio

```gitignore
*.log
*.tmp
*.bak
.cache/
.DS_Store
__pycache__/
```

### Salvataggio credenziali Git (opzionale)

```bash
git config --global credential.helper store
```

---

## 🔁 Flusso di lavoro consigliato

```bash
# 1. Aggiorna la copia locale
git pull origin master

# 2. Lavora e salva modifiche
git add .
git commit -m "Descrizione della modifica"

# 3. Aggiorna GitHub
git push origin master
```

---

## ℹ️ Note

- Il branch usato è `master`. Se il repository è stato creato con `main`, sostituire `master` con `main` in tutti i comandi.
- In caso di conflitti, Git mostrerà messaggi per aiutare a risolverli prima del commit.
