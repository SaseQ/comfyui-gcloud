#!/bin/bash

# Flux
wget "https://civitai.com/api/download/models/1413133?type=Model&format=GGUF&size=pruned&fp=fp16" --content-disposition -P ./models/unet/

# Text Encoders
wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true" --content-disposition -P ./models/text_encoders/
wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp16.safetensors?download=true" --content-disposition -P ./models/text_encoders/

# VAE
wget "https://huggingface.co/ffxvs/vae-flux/resolve/main/ae.safetensors?download=true" --content-disposition -P ./models/vae/

# Loras
wget "https://civitai.com/api/download/models/1755780?type=Model&format=SafeTensor" --content-disposition -P ./models/loras/
