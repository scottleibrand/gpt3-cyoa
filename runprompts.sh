#!/usr/bin/env bash

pip3 install httpx pyyaml fire tqdm

cd api
for dir in experiments/summarize-text/tomsawyer/ch1scene2/; do
    python3 openai_api.py ../$dir/prompt.txt
    mv output* ../$dir/
done
cd -
