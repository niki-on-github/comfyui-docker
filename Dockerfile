FROM frefrik/comfyui-flux:latest
USER root:root
RUN sed -i 's/--listen/--listen 127.0.0.1/g' /scripts/entrypoint.sh
RUN apt-get update && apt-get install -y socat ffmpeg libportaudio2 && rm -rf /var/lib/apt/lists/*
COPY entrypoint.override.sh /scripts/entrypoint.override.sh
RUN chmod +x /scripts/entrypoint.override.sh
USER runner:runner
EXPOSE 8080
CMD ["bash", "/scripts/entrypoint.override.sh"]
