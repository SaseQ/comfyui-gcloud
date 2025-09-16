#!/bin/bash

# Flux
wget "https://civitai.com/api/download/models/1413133?type=Model&format=GGUF&size=pruned&fp=fp8" --content-disposition -P ./models/unet/
wget "https://huggingface.co/QuantStack/FLUX.1-Krea-dev-GGUF/resolve/main/flux1-krea-dev-Q4_0.gguf?download=true" --content-disposition -P ./models/unet/

# Text Encoders
wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors?download=true" --content-disposition -P ./models/text_encoders/
wget "https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors?download=true" --content-disposition -P ./models/text_encoders/

# VAE
wget "https://huggingface.co/ffxvs/vae-flux/resolve/main/ae.safetensors?download=true" --content-disposition -P ./models/vae/

# Loras
wget "https://civitai.com/api/download/models/1755780?type=Model&format=SafeTensor" --content-disposition -P ./models/loras/
wget "https://civitai.com/api/download/models/2106185?type=Model&format=SafeTensor" --content-disposition -P ./models/loras/
wget "https://civitai.com/api/download/models/1351520?type=Model&format=SafeTensor" --content-disposition -P ./models/loras/
wget "https://civitai.com/api/download/models/1301668?type=Model&format=SafeTensor" --content-disposition -P ./models/loras/
