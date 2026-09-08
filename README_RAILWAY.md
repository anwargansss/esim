# Bot eSIM XL — Railway Ready

## Cara deploy

1. Buat repository GitHub baru.
2. Upload `Dockerfile` ini ke repository tersebut.
3. Railway → **New Project** → **Deploy from GitHub Repo**.
4. Pilih repository tadi.
5. Setelah service dibuat, buka **Variables**.
6. Tambahkan:
   - `BOT_TOKEN` = token bot baru dari @BotFather
7. Tunggu deployment selesai.
8. Generate domain Railway di **Settings → Networking**.
9. Set webhook dengan membuka:
   `https://api.telegram.org/botTOKEN_KAMU/setWebhook?url=https://DOMAIN_RAILWAY_KAMU/`
10. Buka bot Telegram dan kirim `/start`.

## Penting

Jangan masukkan token Telegram ke GitHub. Gunakan Railway Variables.

Dockerfile mengambil source asli dari:
https://github.com/MhmdSairi/esim

Source asli menggunakan Playwright/Chromium dan dependensi Python yang sudah dipasang oleh Dockerfile.

Bot asli juga memiliki konfigurasi channel/group yang tertanam di `bot.py`. Jika channel/group tersebut bukan milikmu, fitur pengecekan join dan pengiriman ke group mungkin perlu diubah.
