FROM python:3.10-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    git wget curl gnupg libnss3 libnspr4 libatk1.0-0 libatk-bridge2.0-0 \
    libcups2 libdrm2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 \
    libglib2.0-0 libpango-1.0-0 libpangocairo-1.0-0 libx11-6 \
    libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 \
    libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 \
    libxtst6 libxkbcommon0 fonts-liberation xdg-utils libasound2 \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/MhmdSairi/esim.git /tmp/esim \
    && cp /tmp/esim/requirements.txt /app/requirements.txt \
    && cp /tmp/esim/bot.py /app/bot.py \
    && cp /tmp/esim/README.md /app/UPSTREAM_README.md \
    && sed -i 's/TOKEN = "BOT_TOKENMU"/TOKEN = os.environ.get("BOT_TOKEN", "")\nif not TOKEN:\n    raise RuntimeError("BOT_TOKEN belum diatur di Railway Variables")/' /app/bot.py \
    && rm -rf /tmp/esim

RUN pip install --no-cache-dir -r /app/requirements.txt
RUN playwright install chromium

CMD uvicorn bot:app --host 0.0.0.0 --port ${PORT:-8000}
