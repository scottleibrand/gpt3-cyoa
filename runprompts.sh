#!/usr/bin/env bash

pip3 install httpx pyyaml fire tqdm

cd api
python3 openai_api.py ../experiments/summarize-text/tomsawyer/ch1scene2/prompt.txt
cd -
