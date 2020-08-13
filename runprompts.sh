#!/usr/bin/env bash

pip3 install httpx pyyaml fire tqdm

python3 api/openai_api.py experiments/summarize-text/tomsawyer/ch1scene2/prompt.txt
