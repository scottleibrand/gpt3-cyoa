#!/usr/bin/env bash

pip3 install httpx pyyaml fire tqdm

cd experiments/summarize-text/tomsawyer/ch1scene2/
python3 ../../../../api/openai_api.py prompt.txt
cd -
